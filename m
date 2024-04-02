Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C11CD1284
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG6zlfkuZOKoyJ0QWpgY1/n+3sUEEoQt88gTiZzmZas=; b=1DruPVj9qcvMeRVrHbZtn3zXkl
	ISedNNmrZ1f8Hkic+sX3Yl/tysjLkeSPSCASinYnGMzjzvXe3NmeemJYtpBNN99biYjBuzrtCzYSa
	rRLD5eZNLjt09PZ04ItVWUFZAgFfdwfo4udkEnW0+AiW3K3fk2Wchtph2EznB2L5XX6rCtDySJ4wy
	TjGIFngA3xAwoAUmzG725gKLUk1M5gKpQ1jh4V04KDf7qChCnzQ53gUlf3OnYPR79sbgOVJQNATyR
	zYXtMDOXzK2eiR2ZX1BiWvuaN/W+PpFhhgReIoDeFoyR8OCPtkYm4ocPIHYleSpr0kPE/SoJUE+fv
	+P+oxvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb2x-0000000AZTI-3l5e
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 10:07:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb2w-0000000AZT6-31fk
	for ath12k@bombadil.infradead.org;
	Tue, 02 Apr 2024 10:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GG6zlfkuZOKoyJ0QWpgY1/n+3sUEEoQt88gTiZzmZas=; b=acSfgTiKjjTI/9ozblrf6w3aCC
	XcTuJQu5pC7DTAGttitAB6rZoA8W9UrmaHU9KyyixcbOU3OFWg2TgxtLDv+bl5jGTu3IxfT9qdchE
	e2JnNz7ynC8gORby+on3Gwz8R95cZklqWqDQxe4ahb9gJkR9GD/VitTeCd0/k3vFAuiN1k8TBctIK
	T+hoEYs6PATbnCLdJGm5xQBEGTRAA92smK0VsvXqjgh+YBHnGacGVcn9DWAkrF1eyhoM0CYTuFkhE
	eg1UFqnLPXWTu3vEa7PldMIkeoNY+KC0BJe/AF1Qn5u1UQKqKiJNt35T+TDgUZTjmUM7qxCjhb7eW
	IEJnG5qw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb2r-00000003Xz0-1igX
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 10:07:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4325C2nk020109;
	Tue, 2 Apr 2024 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GG6zlfkuZOKoyJ0QWpgY1/n+3sUEEoQt88gTiZzmZas=; b=Df
	6mqRsC4T6PVVcfPFg/e/I5mU1FoC8txusdpF6CJ2DgnzlLuP5mzlY1qP2kK+DmKS
	NEVt1ImGus8fDv6rjy5TuqAaEiWEdtSlzCDMhSmH7BxMFL9RuQ3wa0Ydcl9spuNF
	zv7ZkxAYa1HJy4w6XmCoYi/3LnadUh5X4VGX2Dlrw9X3R+52BP+JY29xc3n4lniM
	ByV8kp9KUvn4GHfasK84dZ0Hqe8uAeoj04gCxWVTWhkFhHrThv6Es8b0FwOs1H/O
	FcJu6DxvtQ1I3f/g3ozLcny/Cj+BmzTFwwB6CrniSYeyzOyNhGxNMkd1lXaORahe
	+WO+S/uJ0Y1BE5GdqYMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x88eh8ysc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:07:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432A72Cs004841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 10:07:02 GMT
Received: from [10.216.58.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Apr
 2024 03:07:00 -0700
Message-ID: <bdf7abad-3d13-4085-8e75-c0d5ff4b41db@quicinc.com>
Date: Tue, 2 Apr 2024 15:36:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] wifi: ath12k: Add single wiphy suppor
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240401190409.2461819-1-quic_ramess@quicinc.com>
 <0d1058eb-aced-4e81-9f61-e4b5a08c04a2@quicinc.com>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <0d1058eb-aced-4e81-9f61-e4b5a08c04a2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9yprdxqvoRuf9kCGN2ydB0w2_oKosI5i
X-Proofpoint-ORIG-GUID: 9yprdxqvoRuf9kCGN2ydB0w2_oKosI5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_110710_651940_72DC2149 
X-CRM114-Status: GOOD (  17.61  )
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



On 4/2/2024 1:04 AM, Jeff Johnson wrote:
> On 4/1/2024 12:03 PM, Rameshkumar Sundaram wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> With the introduction of Multi Link Operation (MLO) support in
>> IEEE802.11be, each EHT AP/non AP interface is capable of
>> operating with multiple radio links.
>>
>> cfg80211/mac80211 expects drivers to abstract the communication
>> between such Multi Link HW and mac80211/cfg80211 since it depends
>> on different driver/HW implementation. Hence the single wiphy
>> abstraction with changes in datastructures were introduced in
>> "wifi: ath12k: Introduce hw abstraction"
>>
>> This patchset extends the implementation to allow combination
>> of multiple underlying radios into a single composite hw/wiphy
>> for registration. Since now multiple radios are represented by
>> a single wiphy, changes are required in various mac ops that the
>> driver supports since the driver now needs to learn on how to tunnel
>> various mac ops properly to a specific radio.
>>
>> This patchset covers the basic mac80211 ops for an interface bring up
>> and operation.
>>
>> Note:
>> Monitor and hw reconfig support for Single Wiphy will be done in future
>> patchsets.
> 
> thinking about this series in the context of some other patches I've been
> reviewing recently, I don't think this series should be talking about
> supporting multiple radios with a single wiphy, but instead about supporting
> multiple devices with a single wiphy. After all, the existing logic already
> supports a single device with multiple radios, so it isn't the multitude of
> radios that is the issue, it is the multitude of devices.
So far we are only combining radios of a device (ab) and registering it 
as single HW(ah) to mac80211. Currently ah will only contain radios of 
one device. Combining multiple devices into a single HW is different 
series (where ag will be introduced).

Having said that, even if multiple devices are combined with ag, at hw 
(ah) level there are only radios of multiple devices (ab) and hence 
these patches stay generic and call them as radios.
> 
> this would have ramifications on many of the commit messages in this series.
> 

