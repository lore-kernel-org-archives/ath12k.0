Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9863CA0EED
	for <ath12k@archiver.kernel.org>; Fri, 22 Aug 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdSWT3gYgOt4OIy+2Lw7uk7WcpKN/yt+BewlbQw7y0g=; b=fZbvVpEDPM4rIJmGnxpYjZLM8V
	sPHpLz2eVGN/t/vzmnDC8dKVaR0blK4Z+IvBAa4pbmAI66kkjyqLXPS1TCHEln0qiziErBgIVg1xe
	gSAh0Yxs07VxoXlA/bVpYCOolJr0XloD84b126TygsjgS7hQusNpwaEdErXXHKO9tsEjvoYcNpXno
	zpkmiEWsBSuXBmRcYrUW7x4VFI0Y54RxcFkQJxK0buNv1RFkwoAV972/32F7an64BTsjaHC/bIRhz
	P63DDEGTUnXm9yzp8+6QbGnxXoyGuH3FVebom9tKofE+8c/+QoL+65+vac88f3thFJ98lbLPPeRBJ
	h2aLllww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSaX-00000002jue-1VDF;
	Fri, 22 Aug 2025 14:17:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJms-00000001XUi-1iR8
	for ath12k@bombadil.infradead.org;
	Fri, 22 Aug 2025 04:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PdSWT3gYgOt4OIy+2Lw7uk7WcpKN/yt+BewlbQw7y0g=; b=QgSFORX0TCOw07adoDvGF1SdRV
	/E8Vs8Ju2RsQaNxoudnzJxduU+qXoTz3LKpkLuXaSJQVZjXX1+SVtKQklpNbx6+Z/7UsQHwtyq8WJ
	w0uYr78wKpWo646WscACAgaOnMONWoPUGQgE2wLGwt9jAfIQvhVVEKzv4durZvq6a5R8onTJ54Lhy
	8thuhlXcxuCwDKBwgECuHENjgqIpdxkvbyKdYB6/JB5E4+Wl6MKawLOVEQPcTTwFZQuoMxMMbzZTN
	/shRmlP2NZtEzz9/U5KLg3sgaJ8RWycsPA2rYSzfHcv0RKoUEpG0Xtdr6nXn25TLjD1V8AhNEX+Ea
	bO7NX9sQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJmd-00000000pLS-2Yvn
	for ath12k@lists.infradead.org;
	Fri, 22 Aug 2025 04:54:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9BSe022838
	for <ath12k@lists.infradead.org>; Fri, 22 Aug 2025 04:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdSWT3gYgOt4OIy+2Lw7uk7WcpKN/yt+BewlbQw7y0g=; b=RGYjDpVehOmnXb/h
	+t3WD9wcwUu3e+YjzHD4+JS0Kl16DPJON28Dl27vGNXgL2hK1D852XFRgR5Vg9P4
	6PYC3DtR4MVlgINvCV8BgsbN5VBE9nbm8hhKl5aNxpxxNMPvIhi+eSABUYk1ezZn
	mrRAcdvj8EqACUxFHIWejy2QgvP6fQIbzpDEqZW+FMqrX6lbfN+9EHdtaEsMw0pL
	WvxgRfqBAw3Z0RcyZo+eNNO5dw2QMDmilySLNJ7dDWqvHx0DTPdvh7225YH4V1LX
	WC6II+IYqGDZR9QozNhENEGIuHpfkn9jKMmZU1dz/N3L6SmiIYqZxcgriZHa/CMm
	dMGX/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52afvk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 Aug 2025 04:53:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eab5baaso1567839b3a.2
        for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 21:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755838421; x=1756443221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdSWT3gYgOt4OIy+2Lw7uk7WcpKN/yt+BewlbQw7y0g=;
        b=PFL0Olak9Wb1zyIHWKE4cGq6gFYhzyPH/fdbdZOfNrQHiHqyV1ZgQ8ORkHxsqZn/sP
         4ddKtlJ+R4zqcYHUhu8k6sPiRhKJw9l5APrL6XdmG9dODmR+dVBIvfSLMinmLzN8ts3J
         XmH7BEGGze9nBpW7nLyc0b9Q4ouyZKc14YnrbMQmLC7hiztYCgW79qV8ldOcQKxTluvd
         5SjD8YmayzNsQSVFSE0nPHYD9UQAoftxRdto0L42ulXKsLokjgrHp7NOyjGv1WSPjfR0
         cnYhOENZGIURDa13pKgWdSd5Ra8dIGE/6TDGs/ajTGwqpL0ieU4CqZAp7TKhjhvT7Ehp
         drGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhqG0Mo0G93wRRCMWBdHEJ/TdWZ7328Atiw+mP4XmF4hKU94ULIzWFxBSt7P4GlBwkdkA20m8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQr5MZmb+2T4ICt6oqgQRWzkUC+t8yaMCQf9Z5YRE+eudOq/Q6
	vXyYdjXPYnr26W97T98txHc74vRcsU8xJe723ardbWwlE2eLEHqYm3jwu2cvtNdyg0w8s1DlV4U
	UV2mqYtIMwGhotL2mjgw+f0kew6ki8/ruw1VZf57OV7vbydvKec83guADkRfd5wUR
X-Gm-Gg: ASbGncv2yNiZIyxjezFjUXt00sCPDXlgziLRcCL7Op0WcyoSZL5MrcKEQFhgx426Kkk
	Pt6OfLAW4YkOtV3/SMkuYg6F5Owf+NRjNL9zsdIGvrql9evkcqgnpLCUgrdxHcEp/AJV+9OqIPx
	Yj/1qlSF658CK0SsJMEQJPekP2Pf+AkhUqKYfJgXWxp+LJgABXOoelsjnwY/NF1Gl5/SK/A/EyC
	bsM3npET6mUI84PcRAJMrUNwVlfkJmVId4RawJxE9DUJPhehdUh7Ik2KT+ywjdBRr+LTOcSAh/3
	P5+nXRWuyb+bNZjlbJgOHKP2qQpoiuYS3IKLQOq1a4Kjp6Y8bRHlrvh5q+hk561VlcOIn8PfX8b
	IAWk=
X-Received: by 2002:a05:6a00:9295:b0:76e:9f28:ad56 with SMTP id d2e1a72fcca58-7702fa664camr2571567b3a.14.1755838421350;
        Thu, 21 Aug 2025 21:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6u2ikUXUVBUECwrNR1ag6wNqTPXlRsLEuZ68v4REo6NV6FKg5x+PpgePlDfd8KhPT2WYleQ==
X-Received: by 2002:a05:6a00:9295:b0:76e:9f28:ad56 with SMTP id d2e1a72fcca58-7702fa664camr2571534b3a.14.1755838420822;
        Thu, 21 Aug 2025 21:53:40 -0700 (PDT)
Received: from [192.168.29.88] ([49.43.250.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7f0b4f34sm9444661b3a.92.2025.08.21.21.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 21:53:40 -0700 (PDT)
Message-ID: <c7e383a9-c291-426b-a7f1-7845fabbaeeb@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 10:23:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC] Critical Update handling in the kernel
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ping-Ke Shih <pkshih@realtek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>
References: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
 <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
 <4a94fa66-8140-4cc8-996c-0ed097b4004a@oss.qualcomm.com>
 <08fee54dd5afc5c8b4966188eb3016713a3d8c8a.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <08fee54dd5afc5c8b4966188eb3016713a3d8c8a.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BL0kNscEyYv8nB4WTnsfcGlJ8HTAPpCM
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a7f7d6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZEbenvCwA/jsp6YF92WlZw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Iw58rL21pA4ktbaB5ZcA:9
 a=Dzz9079OjwPXSBvo:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: BL0kNscEyYv8nB4WTnsfcGlJ8HTAPpCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6ssyVEblWlRD
 6WYRdTO/nU+o1yBEGLeqbz6ulSkRuhGk+BbEGAfW75nH2TDdHx8HXuU1RETku9djq4Z4T/hLskv
 1G8GiG9t7Iz5QN+22KZirxCeM0UOLp/POL0MYObaLzQT8KhW3mPGYm/GIwBwZhZHjha1FICFZTj
 uxXDougFEr4AfKEVV+6OiYqqxNDi7ppW4DriIzulDvtAOnePkPyBdjF8U4pnSgoPuepUutTVCFD
 OepkFp6uBkmeK/ZRX75MADICPYWbG9fECyxlHGxqsxB4d7v3GYV+mfU8VcUuxlu7/mBRvb1wKWi
 784RwKlPOpSwcbOiKaGEhDla5urwrPbJeyMypBG4qGAaU5LLMtd1ElwSL9x6pvXNUDGFj3mnW9C
 AVMc1qXkCW0QD9B16FJxuhlOzyK5Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_055358_750711_5F8DE6BE 
X-CRM114-Status: GOOD (  25.83  )
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

[snip]

> 
> I still don't like the parsing though. Like I said above, that's a lot
> of complexity that simply doesn't even exist when hostapd controls all
> the updates.
> 
> 
> I really would have envisioned this much more along the lines of having
> hostapd start the channel switch (WLOG on link 1 out of links 1 and 2)
> with an nl80211 message that has:
> 
>   - post-switch beacon for link 1
>   - during-switch beacon for link 1
>     - CSA counter offsets for CSA, eCSA, etc. elements
>   - post-switch beacon for link 2 (?)
>   - during-switch beacon for link 2
>     - CSA counter offsets for link 1's CSA counter
>       (for all the per-STA profile link 1 elements)
> 
> isn't that pretty much it? All the BPCC is well-contained within that
> and maintained by hostapd.
> 
> I'll agree that this limits to only doing a single channel switch at a
> time across the whole MLD, but maybe that's not the most problematic
> thing?
> 
> 
> OK I guess I'll have to think about this more ...

I've also spent some time thinking through the idea of handling frame 
formation at the hostapd level and simply notifying the kernel. Here are 
the key points I arrived at:

1. Using a single Netlink (NL) command:
----------------------------------------
The average beacon size is around 500 bytes. During Channel Switch 
Announcement (CSA), we need to send two beacons—one for CSA and one 
post-CSA resulting in approximately 1000 bytes per link. If we apply 
this across all 14 additional links (MLD can have max 15 links), the 
total data sent via NL becomes roughly 15,000 bytes. This is quite large 
and may exceed what the NL socket buffer can reasonably handle.


2. Using multiple NL command for each link:
-------------------------------------------
In the case of a 3-link AP MLD, where Link 1 initiates a Channel Switch 
Announcement (CSA), the sequence would look like this:

Link 1 starts CSA via NL command:
     * csa_beacon
         * CSA and ECSA offsets
     * after_beacon

Link 2 beacon update via NL:
     * Beacon data
         * Partner offsets
             * CSA and ECSA offsets
Link 3 beacon update via NL:
     * Beacon data
         * Partner offsets
             * CSA and ECSA offsets


Once CSA is completed on Link 1, both Link 2 and Link 3 will require 
another beacon update via NL to reflect the new state.

The complexity increases when, during Link 1’s ongoing CSA, either Link 
2 or Link 3 initiates a CSA or a Color Change Announcement (CCA). In 
such cases, Link 1 must update its beacon to include elements from Link 
2 or Link 3’s per-STA profile. However, since Link 1 is already 
undergoing CSA, it cannot perform a beacon update at that time, leading 
to a conflict in update handling.

To keep things simple, one might suggest allowing only one Channel 
Switch Announcement (CSA) at a time within an MLD. However, this 
approach isn't feasible. For instance, consider a 5 GHz link that's part 
of an MLD. If another link is performing a CSA and the 5 GHz link 
detects radar, it must immediately initiate its own CSA and vacate the 
radar channel. In such scenarios, enforcing a single CSA per MLD is 
impractical and could lead to regulatory non-compliance or operational 
issues.


Even if we somehow manage to address the earlier issues, a new challenge 
arises with managing moving offsets and tracking which offset 
corresponds to which link relative to the reporting link.

For example, consider an AP MLD with three links. Suppose Link 3 
initiates a CSA. As a result, Link 2 receives a beacon update that 
includes a CSA element in Link 3’s per-STA profile. Let’s assume the 
counter offset for this CSA is at position 200.

Now, if Link 1 also starts a CSA, the next time Link 2’s beacon is 
updated, it will iterate through all partner links from Link 0 to the 
maximum. Since Link 1 comes before Link 3, its CSA element will be added 
first, followed by Link 3’s. This causes Link 3’s CSA element to shift 
down in the beacon, and its counter offset may now move to position 400.

This dynamic shifting of offsets makes it difficult to reliably track 
which offset belongs to which link, especially when multiple CSAs are 
active and beacon contents are updated frequently.

Another challenge with handling multiple NL (non-link-specific) beacon 
updates is the need to wait until all beacon updates are received by the 
kernel. This requires implementing a "wait for completion" mechanism.

However, since waiting indefinitely isn't practical, there must be a 
timeout or fallback threshold. This introduces a few critical questions:
   * What happens if one of the links fails to send its beacon update 
within the timeout?
   * Should the CSA proceed with the updates received so far, or should 
the entire CSA process be aborted?

These decisions are non-trivial. Continuing the CSA without all updates 
might lead to inconsistent behavior across links, while aborting the CSA 
could delay critical operations like radar avoidance. A well-defined 
policy or fallback strategy is essential to handle such partial update 
scenarios gracefully.

-------------

Considering all the challenges discussed, I still believe that handling 
beacon manipulation at the kernel level is the most effective approach 
especially for critical updates. This method offers the best possible 
way to manage the critical update feature purely through software, 
ensuring reliability and consistency across links.

Let me know your thoughts on this?


-- 
Aditya

