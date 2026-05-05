

#ifndef NEURODAQ_SAMPLETASK_H
#define NEURODAQ_SAMPLETASK_H

namespace common {

class SampleTask {
public:
    SampleTask();
    ~SampleTask() = default;
    void run();
private:
    void doWork();
};

} // namespace common

#endif //NEURODAQ_SAMPLETASK_H
