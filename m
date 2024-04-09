Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D32CCD1284
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4fqpEXDdKyMGZdE5RRDhqIm8vMvf8Nw2PrnW7+njjc=; b=enFrA1P7yuw4oXkXyaQwqH/ulk
	d+3DMf5HcTeB/YnL7jNslat9E67C2G8pY9Vp3CrTJtmG4wWCND7h1oQCnczF7a9E8gWjbkAWJf+yT
	4tl8bVQOLaeLqB5dH/d2BhtAdSNspM1qC4gofMWky99Klr5Idhlycxwe6qI3p/PHNlLyT/ru/VP0A
	CZW+DFaxA0kreO2PDZug0d/P2nSn7G6FVAJ6wq/oC7asCtTR1AJufwft6rlNwaMV281p8iTwpFasD
	ScreDQCNg/6WlopiRZPNOq/RQh5X1t9czLNvK0LrekDmi7QcpNEs2OlaYNyL8syis9baW5GLkL478
	YnBgIyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruATi-00000001uBD-3HPJ
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 12:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruATe-00000001u7B-2911
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 12:21:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439BnMnP026280;
	Tue, 9 Apr 2024 12:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=s4fqpEXDdKyMGZdE5RRDhqIm8vMvf8Nw2PrnW7+njjc=; b=Ts
	ZDflNxp0vvvfG9VN6DXrZdR16g9d/8VhHqm3/4kr0iY1UmQ5jSjLL+b9xohERQhP
	nC1mXzedR49z1w0AKhw67O5F3tpAffQsl3olBh4Jw/OmwrsNeE705BiinxAAHpgO
	owx8qsevMGK2OmekpU2OdniAnxa7wqk+YH9IOgxs9h2XRAPDWMu0fwnxAKiXd8zl
	Vh2kNvXpzEHdgARelt/EgvtjtyWVfFCQTGtppoMFYltgGE3Uki4aoUUMSmdcRsjC
	Ksvwl7AHyQmnANzoTPCbdMVwAJ3PJXkzITb80KFSFW/LIYipTrgAJac3W3+DOQzA
	vTotPfoqKaIH5qxO3e7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd3nbr7c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 12:21:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439CLKe6030644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 12:21:20 GMT
Received: from [10.110.24.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 05:21:19 -0700
Message-ID: <4038e991-9207-4033-930a-a14eae4a526f@quicinc.com>
Date: Tue, 9 Apr 2024 20:21:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
 <87y1b7jkxu.fsf@kernel.org>
 <6f39eb1c-97f7-4029-a5f2-5ab36ff0f0a6@quicinc.com>
 <877ciq9h3e.fsf@kernel.org>
 <4e67118d-80e4-422e-aa39-73b891ee6042@quicinc.com>
 <87a5nkkfs1.fsf@kernel.org>
 <fd8384dc-b35f-477e-aac3-b7a5f49ce712@quicinc.com>
 <87ttl9drii.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87ttl9drii.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a-KKjqNZk0CNyitMZmIZtfi3wPuKA00_
X-Proofpoint-GUID: a-KKjqNZk0CNyitMZmIZtfi3wPuKA00_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=980
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_052126_673742_4067E02C 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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



On 2024/3/14 18:41, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> writes:
> 
>>>>>>
>>>>>> Ok, i will apply it in next version. Thanks for pointing out.
>>>>> After rereading my comments maybe keep the title simple like:
>>>>>      wifi: ath12k: report station mode transmit rate
>>>>> But it would be good to clarify in the commit message what modes
>>>>> this is
>>>>> supported. And what hardware families support this.
>>>>
>>>> Hi kalle, Could you please offer your opinion on this commit message?
>>>>
>>>> wifi: ath12k: report station mode transmit rate
>>>>
>>>> Currently, the transmit rate of "iw dev xxx station dump" command
>>>> always show an invalid value.
>>>>
>>>> To address this issue, ath12k parse the info of transmit complete
>>>> report from firmware and indicate the transmit rate to mac80211.
>>>>
>>>> This patch only applies to the WCN7850's station mode.
>>>>
>>>> After that, "iw dev xxx station dump" show the correct transmit rate.
>>>> Such as:
>>>> tx bitrate: 104.0 MBit/s MCS 13
>>>> tx bitrate: 144.4 MBit/s MCS 15 short GI tx bitrate: 626.9 MBit/s
>>>> 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0 tx bitrate: 1921.5 MBit/s
>>>> 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>>> Looks good, except for readability I would add an empty line after
>>> "Such
>>> as:".
>>> I noticed that the signal patch depends on this patchset:
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240219111417.1185-1-quic_lingbok@quicinc.com/
>>> In that you should submit both patchses in same patchset. But please
>>> wait until I have reviewed the signal strength patch.

Hi Kalle,
Please ignore the patches submitted separately below.

[PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx station dump
[PATCH] wifi: ath12k: report signal for iw dev xxx station dump
[PATCH] wifi: ath12k: add display tx and rx bitrate for 11be

I will resubmit these patches in same patchset:)

Best regards,
Lingbo Kong


