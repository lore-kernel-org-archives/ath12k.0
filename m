Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F00C83F1D
	for <ath12k@archiver.kernel.org>; Sun, 13 Jul 2025 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyZvakpdmc+ctfdhCgjkf+kMrxFZE2wvdi85totUeJM=; b=vNUdHuYeATMZJ+hNhvzg2jXGBM
	uca5RxrWWycwSpRqjZAsf/ox+lLIs6E2o6zJSZOuMRkfmev7R7sMSseLopqx1v9to2p50adTItIuo
	sebRmq94R1UEJFhbUTuUS1A6eTxLoohr1f93Z5r4iSuVmGr7ITFweUxy4Hd+Zsl82txM0hXKMQ1VE
	vSa4Jpj02Fx9tLiIkU9eB/Ho8idPFKCA/DsTWIyjU0pL57+c0N3rBLYw6uKWcykUzCicXw/lXAiV3
	MaSEiCh9Y9Ck5fZIEW0hyrFIhWrElYIENkjRRpKrtBsrBBdBa3k/0y54SHMRw4SiHPOI0z0fE1waP
	/7AXq+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1vV-00000000Wb9-00C7;
	Sun, 13 Jul 2025 18:59:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1ut-00000000WZC-3Jan
	for ath12k@lists.infradead.org;
	Sun, 13 Jul 2025 18:59:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DIOCmF005612
	for <ath12k@lists.infradead.org>; Sun, 13 Jul 2025 18:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyZvakpdmc+ctfdhCgjkf+kMrxFZE2wvdi85totUeJM=; b=NuMvbprJFlyz7x3C
	JH5Wlk+4c3AQ3GX2iGHS1McjYXcui4G9etHw5xxbmo0XkZeL7V+tLQXp5tFCpTcG
	MBAIS/oOUcpKDtch59KTAdBRKn76mraiQdev6x/r9ajI4qb+M/jTyP2VGZL4ry+P
	gYEP2Me5K6NbshL/ApqHn1PMh3XVFCDdBwwJX6KiqiBzc0BWLcsvl5U09qIH2xaK
	OAlE5X3HcpkKzdy9cN7ki/Tk8V3gaCHSO8krt8L4mpuvGshQ9BagfHLJYnHVS2ao
	tCaFoaOVmEed3eCZU6NOU3SXlkNTypuc/9zLGbHiNd7kgh4xg6fi7hM+k7PefbCr
	eOZgMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37tejy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 13 Jul 2025 18:59:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23632fd6248so36230605ad.3
        for <ath12k@lists.infradead.org>; Sun, 13 Jul 2025 11:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752433151; x=1753037951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyZvakpdmc+ctfdhCgjkf+kMrxFZE2wvdi85totUeJM=;
        b=fIU6yMTlqYJf/dJr6q2c4oXZXAOGl9Eol1HqVCOsQjQGHHsdLRDVd5dtGn1NHpwJrl
         W06zM8Ju1LL0uXlN1JoBztEHtihaDiX2mPqhEhiSCVBmowfIMUXYZUgJT0GnWfQW+ISp
         m5mBhgNWAtsya6YZGFAvca7Q1S2ObqKLTEBC3STv15boPrckUS5WGvWKnsdudW4jHSnP
         maOn3D+0TdCy9pvNP37lWAffNMMOwCTyQOBLxt9SwiROgGj5ngu0AvK/pKjdKkeomHy5
         P13CotrcztlkQO/nFOVE2wWZXPtPL24nudU1WB6Z2uIkYV1327GtHLT2MUAkzrSvEDvX
         E+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVQMFT+hwTcdV+oEqjgqHTDDFBxyrPEC2o/14Yq4zH6ttR4ToNI75x7boa/xc7tCE9OWUpljM8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRDWJSuTKIptGZc/21mhSdFX6neHBiHV+erm/m1KR9PzG5UtH9
	S9bTBzhfl/PPq7mHRDh6Efv7i+oRXqijyL0qlL4h5CA2sziUVvRr6OAmXGvEVHHKuu+ZV35a6ub
	12Y1X+a0no99oZXl5wZwvUuWG1ggA+i+ifg55Tr3OZj85RHv0bkXQEo6P6e1DeYAyboMfvF49
X-Gm-Gg: ASbGnctHkWgW9QAG5yxtjomx+xyIdoHnUv1NkixlGAUWv/vCdmVi5IFY3RBvgq7SLkd
	2GDxssRtN4EGxkENgglhz8TQTi13QnSNaXgkHPU64SRic0qP+KfwC1h2tlDEQwBlYLdV0GlKDm5
	ahG6xPNN3y5MKsMbOP5yqSLfuxuStmeDPUAsSaj7lIn4BrhN+X4artkyRGJKgiLGbLEwhfLdfsF
	xo5xvS9q/GgD4GaY3mHvdljalEsHtEuogTiE6007Z1WecTfvhQ58OJmTUCC4bzcDLeWGCQ0scRO
	tEZm2uPcymgfHfhEiWA/1CkYj90dZ7YFy8GG1CgyS0/7YpkOG8/fEvmpr5XL/JKji5NGHSnh
X-Received: by 2002:a17:902:cece:b0:236:9726:7261 with SMTP id d9443c01a7336-23dee0c6ed8mr164466465ad.39.1752433151464;
        Sun, 13 Jul 2025 11:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuaNgVKheQk3b8imU87osEwh6357NjhpUB01ZTuui3OhavmkVNst3Pv+44GC5dKU3LNhXnLg==
X-Received: by 2002:a17:902:cece:b0:236:9726:7261 with SMTP id d9443c01a7336-23dee0c6ed8mr164466245ad.39.1752433151007;
        Sun, 13 Jul 2025 11:59:11 -0700 (PDT)
Received: from [192.168.1.2] ([122.164.84.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359b6fsm78444725ad.212.2025.07.13.11.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 11:59:10 -0700 (PDT)
Message-ID: <94354e7b-1931-da3a-bec6-78e578468dd2@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 00:29:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for
 mesh
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
 <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
 <21b7d547-b550-23a9-3bff-1f1787e307a8@oss.qualcomm.com>
 <61d6cdebee2c89e5d2d93d3297c94051efb70790.camel@sipsolutions.net>
Content-Language: en-US
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
In-Reply-To: <61d6cdebee2c89e5d2d93d3297c94051efb70790.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDEzMiBTYWx0ZWRfXxnuL2pTkXSQW
 ET2NogtcnzkE9viftdrtrXxgG42AsWKnA3Zvj58O9FgZ/3MxmrROuVnw4ta01v8QnDw11QEhFYJ
 zCyoYyc3XiBrltWDif2eQoJvXDGlX488FwQczg2YW9nM1GaEUqa+PoweNPgTbX0qm3EM+4PScnr
 DQd00i08m4teldQrZJqaSZpM+693IXCgoxKHesa26xVYwlooPF31g0bwQ9Ifx83ZZi+JRZeJMTU
 hvLiXIE7uCqNWJcEnk+Dv9ww9Kthjx26ZRANI4oSXEvq4BDPuHLmRqw2Ed65QUxQYINSsPYrqfO
 WzUaEeXwmR/4FAT+gDVYj8Zly8vW5Gio9NubYCT1ZJRcmAHV8YRYtYLYZYGlbvxNMKgsC6u9aqR
 UbSE1Gfkc1VvpVS6vSAB292pCq8NstDcEE5Mj56b1veaZ01JI1pz30fA4SqD4YOj60dm1ovC
X-Proofpoint-GUID: 2hnZXCEZS5MBMWYpKgXeINBbYWZzmb1F
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68740201 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6VSqIenKxx6KD5xKWEYkZg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QZ1lA0b2CmYMIHELQRAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2hnZXCEZS5MBMWYpKgXeINBbYWZzmb1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507130132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_115915_966059_FC0EFFEA 
X-CRM114-Status: GOOD (  32.98  )
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



On 6/30/2025 6:51 PM, Johannes Berg wrote:
> On Fri, 2025-06-27 at 19:49 +0530, Ramasamy Kaliappan wrote:
>>> I ... don't really understand how this is supposed to work.
>>>
>>> Say, for the sake of simplicity, we have an 80 MHz channel, the lowest
>>> channel is the control channel (so puncturing 0x1 is invalid). Possible
>>> puncturing values are 0x2, 0x4 and 0x8.
>>>
>>> If locally we have 0x2, that means (I assume, since that's how chandef
>>> is meant to work) CCA and RX is always on the control channel and upper
>>> 40 MHz parts. If you're now going to transmit to a station that has
>>> puncturing 0x8, you didn't do CCA on the 0x2 subchannel, but ...
>>> transmit anyway?
>>>
>> Yes,we do not transmit blindly to mesh peers with different puncturing.
>> Before initiating transmission, the driver computes the intersection of
>> the local and peer puncturing bitmaps to determine the set of valid sub
>> channels.
> 
> Hm, I guess that's fair, but why not do that in mac80211 instead, that'd
> be simpler and far more obvious/safe?
> 

Hmm, I originally thought the bandwidth determination would need to 
happen within the driver,  since it’s required at the time of packet 
transmission for each mesh STA. The assumption was partly influenced by 
our existing firmware design.

But yeah, since the bandwidth doesn’t really change much across PPDUs 
for the same STA, it actually makes more sense to handle it in mac80211 
and drivers can use it.

> Also, clearly your driver _doesn't_ do what you say "the driver" does,
> if anything it magically and "undocumentedly" happens in firmware.
> 

Yes that's right, the intersection and BW selection is done for every 
PPDU at Firmware.

>>> I mean, maybe this could work if the remote puncturing is a superset of
>>> the local puncturing? But just blindly doing it the way it appears to be
>>> done in this patchset seems ... questionable at best?
>>>
>>> Can you explain more how this is even supposed to work?
>>>
>> When associating with a mesh peer, the mesh peer's puncture pattern is
>> shared with the driver. The driver evaluates the intersection of this
>> bitmap with local pattern.
> 
> Could also be done in mac80211, I guess.
> 

Thats right

>> if the resulting pattern corresponds to valid transmission bandwidth,
>> the valid subchannels used for transmission.
>>
>> If the resulting pattern does not support a valid bandwidth, the driver
>> falls back to using only the primary 20 MHz control channel for
>> transmission.
> 
> Right.
> 
> I also note that there's not even any definition where the puncturing
> pattern is rooted ... is it relative to the local chandef? Relative to
> the peer's chandef? Clearly not even that is documented.


When not considering CSA scenario then the puncturing pattern is an 
intersection of the local channel def and puncturing pattern advertised 
by peer.

If the local and peer mesh are capable of EHT, the negotiated EHT 
bandwidth of the peer mesh is considered first. The intersection of 
puncturing patterns is then applied on top of this to derive 
bandwidth—potentially reduced and with or without additional puncturing.

> What happens if
> the bitmap changes? Why does userspace track it rather than mac80211,

When a channel switch is triggered by a userspace application,
the user space is fully aware of the bitmap changes and pass them to the 
mac80211 driver.
But when a peer mesh initiates a channel switch via CSA, the mac80211 
driver on the local mesh receives bitmap changes through CSA 
beacon/action frames and processes the channel changes internally.

However, unless the new bitmap is explicitly forwarded to userspace, the 
userspace component might not be aware of the bitmap changes.

> which has the beacon of the peer and handles CSA, so what happens with
> puncturing in CSA?
> 

I am thinking something like below for CSA with puncturing in Mesh,
1. Acquire the puncturing bitmap from the peer initiating the CSA action 
/ beacon frame.
2. Validate the new channel's compatibility with the new puncturing 
pattern, and apply the new channel context.
3. Forward the csa beacon/CSA action.
4. Reset the existing bitmap and apply the new bitmap to associated STAs.

I didn't take care of this in the patch series. I am planning to address 
this in the upcoming series

> Did you think about any of these questions, or are you just using me as
> a design tool? ;-)
> 

No, certainly not Johannes! 😊
I initially assumed the bandwidth would need to be decided by the driver 
  since it’s tied to packet transmission for each mesh STA— that’s kind of
how the firmware seemed to be built.

> johannes

