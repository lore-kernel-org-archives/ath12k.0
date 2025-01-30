Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B187AC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 03:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xug+E7ij4WF0LuLuZ/OHsojEglbBOq/RVcXRzH7G0So=; b=u6195CjJxpr3u8wTcEKfg8sdvQ
	ijoU8mXnHASnh93VoVWPG4FuZlVra1te4q/VH4JgE83vWAAgl0wBYKQICUESVAnl07H12CrKHKFG5
	Wf/AJMiETwvIYelUj/TZSR8iCSXWLUa8BchqOYXKt+hdsMMCs9ioTfeDfHYuAf8HHjrP2DfXYhOYh
	URQV1o+ApCM9iU0B7LDm8lcUtAceVD3TabXqUkmUGKVkwWDRWxck1QoquXsbF/M2/izlhW4szQ7A/
	IwfwimOMU8At0u4LeeB0spdnjJx/0/mL6Rrjkh5b/V9qGgpS2NosDPJMmlk30K1S6Eg5kySMj3+FX
	gfbl9jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdLMJ-000000087xv-12he
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 03:36:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdLMH-000000087xV-117Z
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 03:36:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIlYBO000784
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 03:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xug+E7ij4WF0LuLuZ/OHsojEglbBOq/RVcXRzH7G0So=; b=D2Jz90exge5tU5Iq
	5mMbXyAAMEUkZXPRBiv5/GupHCS2HM05SR7LunIRQIa09LTj/LJicq9weMaPmzXP
	vspB3Gx6oI89A4iKRktHlwNJvD8ymswx8pQBaZu2MePLKKrv2UwO7mURn+HKxoca
	4ZSqQLhWayOt1T6NdOCbxrd/5Hlu/bpKxMIMoVoh5t8BGbtWIe6fE5qQUdMJ1hxm
	PAd4UxE+INIXiuu+FlNJWt0BnbEYnkRGsfjzoS0gUkwddOc/RdtH6Q7sorA8YvEd
	zMX+zdjguDIyrs7fqCrk7QByTvYLsdNFF3Df2Q6O+jdSHabJ5iliNSjeLYkhkm2J
	1UPOsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fswyrxhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 03:36:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216728b170cso7703785ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 19:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738208205; x=1738813005;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xug+E7ij4WF0LuLuZ/OHsojEglbBOq/RVcXRzH7G0So=;
        b=sfdYgfiSer9kOcQ4zCR3EnnggjFrNCUx5lFiLkY5VHpl9Bw+VP+yvtZ8T1luFJ7NaH
         T7UN8dfyltzzYNh2p3vKP0I99ZT7VdK4PcB5aPePiNXg2Fggyqln0kBafujYJcfeoFpv
         GpcptImRrtu9jAPiPrUMZ45B4h0hCAvl8fVFZlHzG5vzro6qosi28fpwpFvInGa0Al2/
         SiNYWTdAv7fxmy7pBCkdSc5FtjC746sKRr770t4cHOR9CTABMmbUrWy65rUOto6nvk9p
         UnXXS5u+2UUgKXLnwKppJanX5wlHIKtvCZol2400e17rtNwc/cJPQAtFGgn2nf57tv/a
         w49w==
X-Forwarded-Encrypted: i=1; AJvYcCUtjFBbDR1TNcW0WewWQSUrrqogp4Fcs4b6Usr5c562TqptDnoWiRaRonqiltSHK6jDqgv/XHM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXUXseHK6XEKwILE+w+JgGI4ASBSka2NcjfbAQO7ph229eJSVg
	WvBBtime6MrSjG3nQzcpImUJ/3dtLPY5CWwVv1nY4G6bwegejyhjZfNzq5Q6z5tpz+uVAnhxQW0
	NtET1ZlUj2Hqf9dXdLSz9Du+d7dleWiPFTbgo00TWjYi8VYsTAZMuQINyQl7W
X-Gm-Gg: ASbGncu26JRcpzzDrhyj+I60pNJjypUlpo32Cpe8iONodcjM1lttreJJ1NbcRFkIPGn
	VgYfE5V07q/A8APocy1jQXS6lgxhWaoFTcycOFWgcPjDNA6wpX//4+5QBqRhMuFEWzTwmriH7/V
	I6x13EKQwkaCSmOCjbs2Ky2oAYMKt/pkL3WoHbVuNcErHkE4bEWs7fr0X9MhTOTGILRAMLuio0C
	+qLQMzZf/uPUsZAla+5A/ivvp/Hy/mVO7dvRPaTVsexV6/qb5IVQYqVINPCxWHM+QI9XsxcSKkV
	YXvdom95PgLOygJ1NHJffBUuT0PtaCEzJ+1MgC0=
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr84253395ad.11.1738208205334;
        Wed, 29 Jan 2025 19:36:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIEes1x7Hp+Gh7oCa5B+RDPrqST2NNoI4k3f4nlFhDmTxUxUeMJxGThJr0IDzpglY+9vqCFw==
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr84253165ad.11.1738208204909;
        Wed, 29 Jan 2025 19:36:44 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331fa58sm3673225ad.233.2025.01.29.19.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 19:36:44 -0800 (PST)
Message-ID: <0cc92ac1-9566-46cc-b130-7546168f43eb@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 09:06:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: fix handling of CSA offsets in
 beacon template command
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
 <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
 <6f52dcd2-3b0b-4c19-b8bd-cd17dc4543b5@oss.qualcomm.com>
 <2b5bdfc8-95f2-4919-830f-c35d152055d1@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b5bdfc8-95f2-4919-830f-c35d152055d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6t0tFMnjeqvqbCVQHJI1pvTnFf2STb4C
X-Proofpoint-GUID: 6t0tFMnjeqvqbCVQHJI1pvTnFf2STb4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=916 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_193649_316602_85D63C8E 
X-CRM114-Status: UNSURE (   9.85  )
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

On 1/30/25 06:48, Jeff Johnson wrote:
> On 1/29/2025 4:40 PM, Jeff Johnson wrote:
>> On 1/23/2025 10:16 PM, Aditya Kumar Singh wrote:
>>> @@ -108,5 +108,6 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
>>>   void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
>>>   					  struct ieee80211_chanctx_conf *conf,
>>>   					  void *data);
>>> +struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);
>>
>> This patch now conflicts with:
>> wifi: ath12k: report station mode transmit rate
>>
>> but i'll clean that up in 'pending'
> 
> 
> please check
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=47bc4c5c6598ef2ff3a362eb13dfe4573ab5d910


Looks fine, thanks.


-- 
Aditya

