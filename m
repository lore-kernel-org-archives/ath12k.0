Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E990C5475B
	for <ath12k@archiver.kernel.org>; Wed,  6 Mar 2024 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYQmoaEpyY3JnzV572+CYB11wSAtEBpddatDgzdYMJE=; b=NNKYoG/TUnC1GeX7YUeeA0n0CA
	CDB0b1++F5Mq3fMZRymx4VYQlhWRBWMC0tclUBAUYqZhEaIXoVGH4qQrwHt/OTXoFWFZX831olhZD
	64O7QWv2wSOrZs238573YFsV23N2xk8muym710xbHnyZKSxvZ0jhyHiGhf4K+5d6hRezcrWanftaT
	QGY5CNjuMAL5NFosYCTvLVPMimym51qYzlLUDmMywah6WXfxVBG2XnVYB3mow/G0egeQ8eMp9uA1p
	TZVPT4Oqym+UBLB3GN+o9E0JVXhvcTdSHaBrXWreMMeQbg0blE415lXeV3r+nF4Uc0AMXRJWgX41B
	glpvm7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhl1w-0000000GaqK-0M66
	for ath12k@archiver.kernel.org;
	Wed, 06 Mar 2024 06:45:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhl1s-0000000Gape-1uW8
	for ath12k@lists.infradead.org;
	Wed, 06 Mar 2024 06:45:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4265iKfG014119;
	Wed, 6 Mar 2024 06:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pYQmoaEpyY3JnzV572+CYB11wSAtEBpddatDgzdYMJE=; b=Oy
	ACk0K0TY/V/WTOviDm8XCFjq0RiEI7v4b4NJTqvZ/pSZMpH7wzoR2ImlQfoFWrX3
	CISnKvEchEjYCvx9vzSPuHlx2t1rH39aAQCliU91AgFXpDe1o/LKzNZFtLXsAAoG
	zpZae4AISvKNai1Wu25pQqZX7go+JcUFtWauhqzP3TrDtWg/ATMqCbBk5zHp1yn+
	80BA1TPW0+sDHcwat0/U9nKRadzwosPE7JeHHq+FZie1R+4FhxJoOlvktYOathvi
	hPBObnR9EX7DQRb/64uBoD4lTwLIrgwQ3KFhpmval5Zw9RbXH2bPOsVpIUD+tsEe
	Fla+2ToviMP8rCMy23ag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpgdsrada-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:45:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266jMxa001790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:45:22 GMT
Received: from [10.253.9.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:45:21 -0800
Message-ID: <2b978117-cd72-42ca-a5d0-fd7a7c644e5c@quicinc.com>
Date: Wed, 6 Mar 2024 14:45:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6GHz AP association failure on WCN7850
Content-Language: en-US
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
 <aa92159e-d2e3-44d4-8514-2c81591cff31@quicinc.com>
 <CABymUCM-9a6z-PPYm=HaUREZ4rjxaZtqxZB7Via4h_vM2wK2QA@mail.gmail.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <CABymUCM-9a6z-PPYm=HaUREZ4rjxaZtqxZB7Via4h_vM2wK2QA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B-JE-cLsu308knDXLBfS7YDlWl0Oe1Fx
X-Proofpoint-GUID: B-JE-cLsu308knDXLBfS7YDlWl0Oe1Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403060052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_224528_528134_1204824D 
X-CRM114-Status: GOOD (  18.06  )
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



On 3/6/2024 10:25 AM, Jun Nie wrote:
> Kang Yang <quic_kangyang@quicinc.com> 于2024年3月5日周二 16:30写道：
>>
>>
>>
>> On 3/4/2024 6:14 PM, Jun Nie wrote:
>>> Kang Yang <quic_kangyang@quicinc.com> 于2024年3月1日周五 19:42写道：
>>>>
>>>>
>>>>
>>>> On 3/1/2024 5:14 PM, Jun Nie wrote:
>>>>> Hi,
>>>>>
>>>>> I see there is association failure many times when I try to connect my
>>>>> 6GHz AP with latest mainline Linux. Does anyone also observe it too?
>>>>> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
>>>>> recommend any specific version firmware?
>>>>>
>>>>> The issue only happens with this version firmware:
>>>>>      [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
>>>>>       [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
>>>>> board_id 0x3d soc_id 0x40170200
>>>>>       [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
>>>>> fw_build_timestamp 2023-09-20 03:43 fw_build_id
>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>>>
>>>>
>>>> Wrong firmware.
>>>>
>>>> We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and
>>>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,
>>>>
>>>> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0
>>>>
>>>>> I do not see the issue with firmware:
>>>>> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
>>>>> fw_build_timestamp 2022-10-11 12:13 fw_build_id
>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>>>>
>>>>
>>>> That's it, i recommend you to use
>>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.
>>>>
>>>>
>>>>
>>>>> Detail log can be found at:
>>>>> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-association-fail-log.tgz?rlkey=pg2ifnzcttzimz7vaxb7tuc6w&dl=0
>>>>>
>>>>> Jun
>>>
>>> Hi Kang,
>>>
>>> I see wlan0 failure with below log with firmware version
>>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4.
>>
>>
>> Can you check if you completely replaces our upstream version?
>>
>> It is best not to mix it with other versions
>> (board.bin/board.bin/regdb.bin/amss.bin/m3.bin).
>>
>> Mixed use may also have an impact on throughput.
>>
> Yeah, tried to replace all binaries from below path, but no help.
> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0
> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 

So, both WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4. and 
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 have this problem? 
Their log is the same?




> What's your test platform? I use sm8650-hdk. Not sure whether there is something
> platform dependent.

Our test platform is x86 devices(normal x86 PC or x86 board).

These binary can only be uploaded after detailed testing on x86 platform.


> These binary was tested OK with Linux mainline on some QCOM platform, right?
> 




Your platform is arm. Actually, we never test whether upstream firmware 
of ath12k can work well on other platforms. Any errors could happen.



Did you download this firmware by git clone? Or just download manually.

Please retry with git clone if you download manually.







>>
>>
>>
>>
>>> Do I need any patch outside mainline? Actually, I add below 2 patches
>>> for 6GHz band.
>>> afb7a22d9e22 wifi: ath12k: build 6 GHz regd based on vdev type and 6
>>> GHz power type
>>> 6c60469f0bae wifi: ath12k: add support to select 6 GHz Regulatory type
>>>
>>
>>
>> If problem still exist, please revert these patches and check again.
> 
> Reverting them does not help as expected.
>>
>>
>>
>>
>>>
>>> [    6.194535] ath12k_pci 0000:01:00.0: setting mhi state: INIT(0)
>>> [    6.195067] ath12k_pci 0000:01:00.0: setting mhi state: POWER_ON(2)
>>> [    6.195069] mhi mhi0: Requested to power ON
>>> [    6.195083] mhi mhi0: Power on setup success
>>> [    6.196541] mhi mhi0: Image transfer failed
>>> [    6.196559] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
>>> [    6.196574] mhi mhi0: Reg: ERROR_DBG1 value: 0xff7fc000
>>> [    6.196588] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
>>> [    6.196601] mhi mhi0: Reg: ERROR_DBG3 value: 0x1988
>>> [    6.196631] mhi mhi0: MHI did not load image over BHI, ret: -5
>>>
>>
>> BTW, is it a probability problem?
> 
> It happens 100%.
>>
>>> Kalle,
>>> Thanks for the reminder of attachment size limitation!
>>>
>>> Jun

