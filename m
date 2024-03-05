Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9FCC54798
	for <ath12k@archiver.kernel.org>; Tue,  5 Mar 2024 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy1yy7n88DJdR7DLfPYG3w9GqqegPKaLbqWhuUfgv9I=; b=HRewdaiLFqcvBl04N9aM/T1egG
	unXTAGc73af/bVFbj95ED9jBONmV+idEygZRY22xttn+zZcdK/jluM0KT0KR/+Isz7SR0UnJdsMjd
	Vj8xb+mMWrE46ERRtLHk/gVLXM9RQjHflBMzl+rPUW/1Vz1uCqS1rrVc4F4ibQsgrNd1OuqXMQEew
	96FJMwjgtEOo7FoAdm7akPmDtOLjnF3VzIACn+YmX/+8ErijwerkhyFoFj8Ea8klkml7IeAtuJ0Iz
	BjjiKe4PqRl5iiVaM3DkYTbBte0rO7crUIkGXf43XkHRF2MbFVdK+YgsQ462VK3inedT9FwAL6Cxk
	Y1+IkhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQC0-0000000CcQ6-3lFj
	for ath12k@archiver.kernel.org;
	Tue, 05 Mar 2024 08:30:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQBw-0000000CcOi-3es9
	for ath12k@lists.infradead.org;
	Tue, 05 Mar 2024 08:30:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4254qf4G013738;
	Tue, 5 Mar 2024 08:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sy1yy7n88DJdR7DLfPYG3w9GqqegPKaLbqWhuUfgv9I=; b=IT
	TOlG55qVpf1d+x5e+44nEs5DXFwBJU6dVjFLI5isNKQo8CJlNzDgzJEYh5/cLBp1
	0ve6dk6ueeYCxo24Mte7isyt/pqCp6KLHaplMWobtj9p4s/2vUcX9yYMznxoemGu
	VsTNtKo/2kRSbH09HCQo6DHDJewM6bqbPCISlQIuZYj//fRomUyuKtEfQ7MOAv9S
	nntA3dPm9w2LfjjzqfQkMqabOJsQw+nc+9oufahSGqi5rMewWnl7BgCp77Y25Svu
	GCc3qM1r4l8YJ7k9W6EkJnqAztKTTXSAb0vCdFwJ7qHjIJLst5y73KvQ5QYNAL0U
	4R1mzUjlRmrfCqYKKcrg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wnarj2qp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 08:30:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4258UKEQ029863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Mar 2024 08:30:20 GMT
Received: from [10.253.9.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 00:30:18 -0800
Message-ID: <aa92159e-d2e3-44d4-8514-2c81591cff31@quicinc.com>
Date: Tue, 5 Mar 2024 16:30:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6GHz AP association failure on WCN7850
To: Jun Nie <jun.nie@linaro.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>, <kvalo@kernel.org>,
        <quic_periyasa@quicinc.com>, <ath12k@lists.infradead.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
 <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
 <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com>
 <CABymUCMntFfKPRZyv+PzmNB3WejG7v5Y1-AYhXRK1o++U_xnRQ@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <CABymUCMntFfKPRZyv+PzmNB3WejG7v5Y1-AYhXRK1o++U_xnRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CyKLe2cuxLyOND24EVXfvp270PCl0B8M
X-Proofpoint-GUID: CyKLe2cuxLyOND24EVXfvp270PCl0B8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-05_05,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_003028_949806_7A8C8804 
X-CRM114-Status: GOOD (  15.53  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 3/4/2024 6:14 PM, Jun Nie wrote:
> Kang Yang <quic_kangyang@quicinc.com> 于2024年3月1日周五 19:42写道：
>>
>>
>>
>> On 3/1/2024 5:14 PM, Jun Nie wrote:
>>> Hi,
>>>
>>> I see there is association failure many times when I try to connect my
>>> 6GHz AP with latest mainline Linux. Does anyone also observe it too?
>>> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
>>> recommend any specific version firmware?
>>>
>>> The issue only happens with this version firmware:
>>>     [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
>>>      [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
>>> board_id 0x3d soc_id 0x40170200
>>>      [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
>>> fw_build_timestamp 2023-09-20 03:43 fw_build_id
>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>
>>
>> Wrong firmware.
>>
>> We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,
>>
>> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0
>>
>>> I do not see the issue with firmware:
>>> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
>>> fw_build_timestamp 2022-10-11 12:13 fw_build_id
>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>>
>>
>> That's it, i recommend you to use
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.
>>
>>
>>
>>> Detail log can be found at:
>>> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-association-fail-log.tgz?rlkey=pg2ifnzcttzimz7vaxb7tuc6w&dl=0
>>>
>>> Jun
> 
> Hi Kang,
> 
> I see wlan0 failure with below log with firmware version
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4.


Can you check if you completely replaces our upstream version?

It is best not to mix it with other versions
(board.bin/board.bin/regdb.bin/amss.bin/m3.bin).

Mixed use may also have an impact on throughput.





> Do I need any patch outside mainline? Actually, I add below 2 patches
> for 6GHz band.
> afb7a22d9e22 wifi: ath12k: build 6 GHz regd based on vdev type and 6
> GHz power type
> 6c60469f0bae wifi: ath12k: add support to select 6 GHz Regulatory type
> 


If problem still exist, please revert these patches and check again.




> 
> [    6.194535] ath12k_pci 0000:01:00.0: setting mhi state: INIT(0)
> [    6.195067] ath12k_pci 0000:01:00.0: setting mhi state: POWER_ON(2)
> [    6.195069] mhi mhi0: Requested to power ON
> [    6.195083] mhi mhi0: Power on setup success
> [    6.196541] mhi mhi0: Image transfer failed
> [    6.196559] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
> [    6.196574] mhi mhi0: Reg: ERROR_DBG1 value: 0xff7fc000
> [    6.196588] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
> [    6.196601] mhi mhi0: Reg: ERROR_DBG3 value: 0x1988
> [    6.196631] mhi mhi0: MHI did not load image over BHI, ret: -5
> 

BTW, is it a probability problem?

> Kalle,
> Thanks for the reminder of attachment size limitation!
> 
> Jun

