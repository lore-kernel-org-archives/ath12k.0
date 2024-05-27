Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7282C25B74
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbWT0OYBL0sXmYs9/6wOU9J+1siBBa0oeVWQYv48oR4=; b=kZTC8z6Ao2xGKistozfEMICKtr
	GSRimB32zsxXQsaFJUJeOZfgdPFz3Iy6edfPJ8YuUCS4d38bXGagqbdcSfXvDC3tw/bd4mTe8rlbC
	pvx2hNox8ODl1GoLITSYbe6rE1kD44TYqsB9cuDRT9IrlhKivF0MK4oVxjik1JjzR/HrX4X2VB+Tz
	edlWdvZ2NaJklYTCZhf8QtvsZ/YbyZeozN4eQDNHXJvF2e1jd2EPbCfWJHU5+68tenye+hjCtkPzA
	X4lEZCLdLoGUJGmNCpfe+JKBV8K04tKZSe9SbC3lW0vi6g6Dm9JmL6fJLPb1iLmmpk4IRElO8QpZ8
	n8JQZfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUJQ-0000000Dzgi-1kNc
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 06:58:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUJN-0000000Dzg9-3NUD
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 06:58:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R0j27f024686;
	Mon, 27 May 2024 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbWT0OYBL0sXmYs9/6wOU9J+1siBBa0oeVWQYv48oR4=; b=hGUQ0lkBnGF8JLM2
	29iB6HSmCjDluakcMpJQEjxsm67id5yeMyObVqa3cBAaZXCiTBrXcStEo/uCHNxe
	FcZ+snFYv2PMrOBkSaU754ds2QmpAv5GZIJqfWXClLZc7WN6ETwof3POOaH6oJdH
	NxQCUMc1wjNqDxvMhyrUIjm2BFIoPCPUY88GkckSmlqfynmdwUs+3g5TLBs3a1ZB
	uXDvbEseSg7pL+VHNEEQqf/Oodj9r2tyLBHFlCNwhp9LSaU5PZh5sHGqexA+KcTz
	8zJfUnIFyPVAVOCw8l+j67d+Un5UriY5VNEtPPZ+J4QQ9pjabmsfqRc39oQSsOdz
	ryqr9A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2natrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 06:58:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44R6wMBM024443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 06:58:22 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 26 May
 2024 23:58:20 -0700
Message-ID: <72b97a7b-7d8a-46a6-a613-8461b5480e3f@quicinc.com>
Date: Mon, 27 May 2024 12:28:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: Add multi physical hardware iface combination
 support
To: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <0dcc9afc-98ed-4f58-a368-79a5242a5bec@nbd.name>
 <d86fc714375c8adf772ddc83ab4de514273034bd.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <d86fc714375c8adf772ddc83ab4de514273034bd.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YVSDR1laGjAGjpklA7lR03YLssag6r6X
X-Proofpoint-GUID: YVSDR1laGjAGjpklA7lR03YLssag6r6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=657 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_235825_905435_835FCC61 
X-CRM114-Status: GOOD (  23.50  )
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

On 5/23/24 22:11, Johannes Berg wrote:
> On Wed, 2024-05-22 at 16:55 +0200, Felix Fietkau wrote:
>>
>> The key differences are:
>> - Only band bitmask and optionally frequency ranges are provided, so no
>> per-radio channel list
>> This is easier to track and vastly reduces the amount of data sent to
>> user space in the wiphy dump
> 
> That makes sense, though in your RFC I'd probably remove the band bitmap
> thing, and make the frequency range not be optional. Perhaps in the
> kernel it could be filled in by cfg80211 via a band enum (taking
> lowest/highest frequency in the band's channels that are there), but I
> don't know if I'd want to have to check with this all optional
> throughout the kernel and the userspace advertising API.
> 

Agree on that band bitmap thing.

>> - No integration with ifcomb. I don't really see the need for that one
>> at this point. It can easily be added later if it's actually needed.
> 
> I mean, sure? But I think that's being lazy, I think everyone else
> thinks it's actually needed. I just got a question about interface
> combinations being broken on iwlwifi because we advertise AP interface
> type in a combination with two channels, which can't be right. I'm
> fixing that, but actually it _would_ be good to know for hardware that
> actually does physically have the capability to operate on two channels,
> and then have the bands etc.
> 
> So I do think (some) integration with interface combinations is needed.

Yes! At least for radar detection, some changes are required.
Grouping 5 GHz radio with any other radio, we will need it or else 
current interface combination check will fail to register the single 
wiphy hardware.

We have a check like this in wiphy_verify_combinations() -

/* DFS only works on one channel. */
if (WARN_ON(c->radar_detect_widths &&
         (c->num_different_channels > 1)))
     return -EINVAL;

And if the proposal is to keep c->num_different_channels advertised as 1 
only from the driver then in [RFC 2/2], this change -

+    if (ieee80211_num_chanctx(local) >= ieee80211_max_num_channels(local))
+        return false;

will never allow to create a channel ctx in any of the other radios 
except the one which is brought up first right?

ieee80211_max_num_channels() uses the interface combination advertised 
value from driver, so that will be 1 and hence if you bring up on 5 GHz 
after 2 GHz, that will lead to 2 >= 1 and hence if condition will be 
true and it will return false. Then 5 GHz bring up will fail. So not so 
clear on this approach.

Considering above points, feels like under any situation without making 
interface combination changes, simply it can not be done. Some or other 
issue might pop up later once we try to enable all features in MLO as 
well which currently exist in non-MLO case. :)


