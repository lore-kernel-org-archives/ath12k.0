Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5EFEE4C6
	for <ath12k@archiver.kernel.org>; Sat, 28 Feb 2026 06:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5HRmL5LS7Bo75m18iXU8GhRBHVClnflsqj8BTS5pDc=; b=CnYQdhA1ojJHf0mdAenmO8/gnZ
	sMfp9bwpRcQtvuCR25lFNANHnbAVo6mmo12/BbxIXVWtWBgfH85PtDBcuWs/Iu6Y9fPZ4HSFytG3y
	D5xWQ8tz0e35tCxz612G9HNsxMdHgSot3XlGBtE9EvSDBdFW+kayU5E9RDtOwfoB0e5J2DUZ7g8Ob
	+8ABGsDlBkB0aUShZPFIKvUL/iC7tfYVXOeT7oubSc088fq7aeAT5EM1fPpKl4cmWKNRQvn0yaRAa
	FST99Friv4QaR3SgAzrSiwoYu6lgt0FYkJgxtvKFw/dLe5+dV/VvNAkiffrT0Dmcf02Ndv9wH4Y3f
	ETg4khRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwE6K-00000009ZGZ-1DNA;
	Sat, 28 Feb 2026 06:46:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwE6H-00000009ZGA-2fd4
	for ath12k@lists.infradead.org;
	Sat, 28 Feb 2026 06:46:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6W45O3590233
	for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 06:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5HRmL5LS7Bo75m18iXU8GhRBHVClnflsqj8BTS5pDc=; b=JYBKBC0orY2gKW3b
	bIqVgm7mATzhhQZrQ2Sl0oLRmqo1inGCqiZSTEgvsTTNlIarDulOE7i3H6eXvayz
	3hqIxoCVqY34ZFRIJt6WHJf7pDK30EGpk0oUWoinA/atFDfoUygHvHcrl3iInKVl
	KpDg6XL9u7nK1tpKbqLefHn4IAnMGu4laKVIPTtR9d5ShKFPX7JFazb1bXz1kTic
	thRJRxeWEdRVI+EgpeBHjg6QoBf2Mugx29FW9mXciLHlqyRRBc0gT9mO/Sc/eotG
	fCn5iU3fmvgNUkgTFEPpmcjLV/2E8NW49BxVmAeHuh/CmMnpoSMfqm+Me4OPzjpE
	JJ0aEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6gad9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 06:46:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-827470bd62cso825656b3a.3
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 22:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772261211; x=1772866011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5HRmL5LS7Bo75m18iXU8GhRBHVClnflsqj8BTS5pDc=;
        b=TTPbVGdL/2MB/x5QWA5I0UdUW5NNlrvDzxzXZ7cLfK5CurJS7HQ4ObkluGlIIr8S0F
         XyEe9OchV9rAz71WJBXyWqyYyA7NDC76cPpezYKH7ku4CkVaS/6Wm9RL2LK3v9EV8KGG
         aduKCrwH7nhwYJoj6PLEISgdjPuzz2N398rxytEHrSn4HrayVYmMQtbYa0x0DVLydSfq
         HJE3zKtUCRA3F8YOTaO+4CG9KEP7iwelqrZnQweinGVJ8uP/lQWSqiy2WZ7e+LevYjXa
         jQn0LIdtwvX4Ydn79+L5TyujrAR5MAHw1i0grEEfMMlE92uJbS9CtUFTLk3PSVzy1r9l
         LLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772261211; x=1772866011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5HRmL5LS7Bo75m18iXU8GhRBHVClnflsqj8BTS5pDc=;
        b=Ad2R9RyESWVRpILKZeT1+l1q42MsXg4qmWyOb+jeXaElIZSAlx0BVEG4gB/HXLrLdT
         X75BDP3xS7Ua1SYgRJAjWbywhsiqLCAJteXvWiRIVGNNg2sj/NiOKSYSP8SIQg3V0sfr
         eTnihQ4fyYFu3km4nZ01XUD1Tt3qWqH6PXZDvCfMmS+pk4F3/ZgSHxCXtaSplr0mTi/L
         u4lrGuSPojFHub/Is/8R00tBUiZFgE+nBUwGacJPP52w4ISrco8va3ebyvcQppSCwqUc
         ccA5hJbMq/jC/8OzNuyeo5vSvacI9FdoYWv9za+XFcldlp2LCK1TBehTnlmZAsY+/qW1
         Dr1w==
X-Forwarded-Encrypted: i=1; AJvYcCVBiTBrmklULqnBqf0YNb+Oy84hfBeKxDkB36S1nQalNgBBBnSJgFd25tR+f+nJAopO78RV9x0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzl20qSmvmHIT3bn235RT3W2FP1U1L7LB0w1pxcZ8impV/p3yU
	L3YnU0kzic0ScZaQuJOvmwvPnvDRpfVQ60SbrqJA/KFvGDw1VP9pfpWmE2TQt8nTX7fP8rCMw4H
	Qvj6UlYK6AOnN8DCgW9Icclgngs3+re8qKcTWzaf3lmoCoOHbQbFa4GyLS08jvNE9eRkrJmWP
X-Gm-Gg: ATEYQzznR3W0/mfk4ZULVRbY5LpRoMGhBsQqCn5QZJhghERO2TMe/jTxUeV4aOc2VBQ
	ZfeSc42zFUVm5EiWul+0RonMedQrKoEa9nskrhnX5eyWXo7nOpMDuecxrh9R5nyWgLJbcWoKhge
	SyCteK9bCFfjamy57BDKC0dpjpHrRI+yWJ2PwSi0mzwNhVCAtkQew5TWMtLIrMUjuKUhDyDA566
	cHqvZ7eT4Y6yXZhcXxWgxvQlNRvt7CyjvAexDmjh5Glgw0wFkK2XDECjBRIpHfR7Ml07RtYvJBl
	Uamm6GFA6UnJ6jN0btlz8WNV7dKTEKjDjfLh9H6nPPKvzCCVJOxzF4q8vohOmY5NmDZQdtae5j0
	Y06soBHAS4YFP9yA16CWI2zjJz2clkJoy2JK3FaCoEnR7F0y0IkUUXvX3KHMva6L4X+k=
X-Received: by 2002:a05:6a00:3e1e:b0:823:f74:662f with SMTP id d2e1a72fcca58-8274da093aemr4890754b3a.51.1772261210991;
        Fri, 27 Feb 2026 22:46:50 -0800 (PST)
X-Received: by 2002:a05:6a00:3e1e:b0:823:f74:662f with SMTP id d2e1a72fcca58-8274da093aemr4890736b3a.51.1772261210506;
        Fri, 27 Feb 2026 22:46:50 -0800 (PST)
Received: from [192.168.82.30] ([157.51.81.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a99esm8637790b3a.47.2026.02.27.22.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 22:46:50 -0800 (PST)
Message-ID: <aabb1cf8-afe6-4ee8-8946-01c162c0a432@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 12:16:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the assignment of logical link
 index
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
References: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kUHCOUVJD13DDX471HCNmNLdPiCkZ37F
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a28f5c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=246QjU3JZtZKFnheHnOONg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YqZLIXxkOqM5MmwRYRkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA1OCBTYWx0ZWRfX5Viyy4hUufUj
 CRAXEOHRR43jx+b7qDQ+dNru0M8S/AyWl67rDZ3tSFIsxQX7DKpgP+ktXOTY2XkEXU6eJXOTLhx
 kTH/JOt9252lyq4p0+gsedY1+zs0CPZyArx2q5j3VorcEvSDU/N96Qe+nfELRYVqRzvI3PiA7Lu
 sNN637mds4Y+b8NzArnaABm2yJuNVPaQ1whaesGMiO3VeZKUpYr484tVg61/znlP77Sd1bLi82D
 ubZ8fhcQ1zzwlnD5k7gV4lyAcdnJ7CDZGPsZt4bCbvb/QL+UEPRlOGFo0ueQhC/Wusn+Vo1+KMX
 BMHzg7x+v7EPSRyNov7bthY2SvkWKfG3aLcvAPx5bAZgod2Yy6B7Xy50L4QaBNZZFZDfziYGQjf
 6VDVSvCyw9pFpuWlt/uGuQCY3f94aEE+Ey/QVEzSEPurYPfL2E6+4DehuPq1xHS8Ud7SmImbQ0b
 005X5IRYfH1US/0OJtA==
X-Proofpoint-GUID: kUHCOUVJD13DDX471HCNmNLdPiCkZ37F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_224653_838623_A076BB9C 
X-CRM114-Status: GOOD (  13.44  )
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



On 2/26/2026 9:49 AM, Roopni Devanathan wrote:
> From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> 
> Per-link logical index is assigned from the global counter,
> ahsta->num_peer. This logical index is sent to firmware during peer
> association. If there is a failure in creating a link station,
> ath12k_mac_free_unassign_link_sta() clears the link, but does not decrement
> the logical link index. This will result in a higher logical link index for
> the next link station created. Also, if there is a leak in logical link
> index as we assign the incremented num_peer, then the index can exceed the
> maximum valid value of 15.
> 
> As an example, let's say we have a 2 GHz + 5 GHz + 6 GHz MLO setup. So the
> logical link indices that they have are 0, 1 and 2, respectively. If the
> 5 GHz link is removed, logical link index 1 becomes available, and num_peer
> is not reduced to 2 and still remains at 3. If a new 5 GHz link is added
> later, it gets the index 3, instead of reusing link index 1. Also,
> num_peer is increased to 4, though only 3 links are present.
> 
> To resolve these, create a bitmap, free_logical_link_idx, that tracks the
> available logical link indices. When a link station is created, select the
> first free logical index and when a link station is removed, mark its
> logical link index as available by setting the bit.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

