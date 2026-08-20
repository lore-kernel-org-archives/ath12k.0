Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925BCC5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=; b=XkwDmA+PZX5QpsgwQxe78SlIg1
	nM9JogFdxS5awD4zAQwxvcJ/N7B5GNrCDy+GbRKK9HEHC5jiDfvSnXwbdIh3xpsxqcNTOUZ+F8Lej
	3VlnhDX1dFOqPiEMvyxzNqoUwwwKz/B7fARKIoFrrvJj5NOhgpuZABefQegRheNbnIRn3I4qlI15F
	PwZoKgQOOQAEZySk8L0oZCEOBEyMqPmwhzLXjf/ytI8KbyVZdDVpldLq06h36NyQv5se8NOn6o2zT
	ZBsYGBrCojKeAAoQS1jde3y0vWnCUIFpLZ+vYvx40+tIK1je/QGPtO0fwbE1M/1+bYT++U3sEgMLI
	G8y9o4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6kz-0000000Byb5-3Ysr;
	Thu, 20 Aug 2026 17:40:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6kx-0000000ByaP-25zn
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 17:40:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KG6o4H3920095
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 17:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=; b=CJZ22GQZPhA2HOxv
	SSIjYKrOwKpLDnbPjkmy1agfxPk2AvUyJTmi0uYYE1vVbUIlq69+QQ84xZYNwAOR
	25gqXnymDAV4iAKrfeFsvu8Qplds9at0xjgWdooDJyyuqcZ4vsbZjkxP34l/sz0G
	AZL8pmKwkodHkI1c3mTr/s2z//jNCz7KxfN3OnWK//q35bgNE548PXvZqwNFhA8z
	LgoRwo/fbucHtNszvR+iYI78mPs5kw03u2JCI6OW87S4D4l4cUBjGIHeDiOY5Q3a
	ZskUsHIttP1TczLuqPsKKTYCaUJLErxTNKvnqA+KRBNIdFMqMeNMZkTrgTv35vYQ
	mQdSBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49apak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 17:40:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so72949b3a.1
        for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787247645; x=1787852445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=;
        b=df66v0caIzOQJGc0TSPIZhD54wJt6FLEGXlNngQ4CLYL+/NsldvAWbTsTOxByXujwT
         TNCYDhesbTW2ZbCmKOkPfnoQLmFoCG0680x5fY0OmzSZIUQe1qLFyrgAzOUlQuWHNkh/
         NGvM2Ui60Ix3+q+p5lsaJEmsLLBf7uw1xBOHsLpGcfVYUeOhdzNxh+xoUhUo92ZXzdmw
         9EQ+o0EGO5IcayCrt2bjfWZwSXRFe0bca8ljvB/foSEqDewnDh2KV/YXUQszofJ9kxTv
         5n6aAkEuiHn1RAeDe8hpYSxaITG8e2cH7EvvVToE7eyi6KF/Ty3/SFlPMUwDd4vpq4Ud
         wyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247645; x=1787852445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyvVMNnSHQRd17KJq3rwbV9DOJ8cp9AOfAXyWtz2edo=;
        b=dfLfFN7W21oQ6WFMrsh+grWVppE72VVA3aNtiaoT8NAs1F3auj4pfY8y6YrSdgWN0F
         N0kjWEkNza0oTBLOZ+hIx2zhXRKQ0ZAikcUyedHDlk/T5P8iN3T1udlFpJ5IJSIxXK3u
         jrhDIBX06ixKULZOjIPqdQ6/r20n864c5CsoHRQSkiAITWUXDt2UlLEtdlJiUsvzODAc
         eEWra1QdjvREFOGCabS8nfICLR5my10MeSfxY81v5KHmNmLhvVvU53JUL9IoOaxgxKah
         ds2LTVAVXRSACc2bZ31qss71VF/pOsQlXZ7su6ukz4gei5n3Ho4ZMhjrT7vCUeQfz7mH
         ChIg==
X-Forwarded-Encrypted: i=1; AHgh+RpckrhlA8lPTgs2IIGePHSPXQjrro7l/3IQVA0ldaowDJi6xdIqrHuqGZ0JsCC4xMgZnPCFSgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzlDQ6GPheqbVwyUGSPakU4sM7tu8ZuE3eCW5NnW2R8v6Ov7Ga
	lSg5rd4R5ZGKjVRFRgfb0/DwloHxjaZkNed6w/XnbLewdJOrah1ajL7OQ+hyauBCWmjGBXfnU/G
	FEgVLBPspXOTdFyAXBFR7nfQnHRSb6llX5Z+S2AyKSdk4NYWM/MZzqI6AQ31NWUWo
X-Gm-Gg: AR+sD13mtLqf2AzkUsn/bfyuzqlPTh7BhB2hd18+9wpxu13D99Zn3LlXNJSk1x8+dLR
	PDlh9RYWARC8GcXBhkQpWIue15NewmGv57C/8pQsZfSNv/82N4TIIZ2GcUe4sIyYcqMC6WoVSDA
	oQFDbhP0XMbIPiHgE8U99ISq5qL82CWxTs5gY486GstgX4yvHbVijRP8j5aSyKxbRDpck0S8twO
	eL/NXNHLW8m8DdgzC9awFeFvRtfZgRM6CphSE56jkxmy+09Hv6NQah/pgD16DpgxEfQqmUgXpDt
	IP4QGsg11n7kJJaa9BWm2I1WBd8WCiyTjeox+A8hn8BwBBI1mEcrXC15KacRLAqfp2apQfLCl4f
	uMGhE58VLoH62sGNxA+f1Ti0g7AiB7xSfPlA8W0V2EUbl8q5jd6kJ9Pk=
X-Received: by 2002:a05:6a21:918a:b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cd301379e2mr97402637.15.1787247645279;
        Thu, 20 Aug 2026 10:40:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:918a:b0:3cc:841d:bb26 with SMTP id adf61e73a8af0-3cd301379e2mr97301637.15.1787247644794;
        Thu, 20 Aug 2026 10:40:44 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c3fc6675sm26861387eec.13.2026.08.20.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:40:44 -0700 (PDT)
Message-ID: <80f99583-eed0-40bd-856b-56cbad973912@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:40:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 8/8] uwifi: mac80211: pass error station
 if non-STA transmit was requested
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
 <20260819155703.64912484c2ba.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819155703.64912484c2ba.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzMiBTYWx0ZWRfX5jxgDrumcO5G
 EPckbBXK1PxCkTvUYzt7tbK/DthyfG7NhxGz1+V3NO0BjegmrdkZ6wgdlmCokMzMV9ag0AGGHDR
 TiG8K6eAY8caLpVhafvW/g9LzNRLYzY=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a873c1e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=mPF9hNEBIKWWczyiqVwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 2WJcFNlm3nITuRqlqSAaymE1i-O5Lo3M
X-Proofpoint-GUID: 2WJcFNlm3nITuRqlqSAaymE1i-O5Lo3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzMiBTYWx0ZWRfX29j17TBtMs14
 n6vxza3ar3/T+Ui2mk62iJpQvQ3dqlZIin9GgeN834fDhre2XuDrzMCOClGkVHuWNF9jWeI9xHL
 M0pGCQmQ1yicroLx2VJUEncs4SsIoup90N+Rjwz+Ak0UG8VFTaxdUNeLePEO5Y4BNcnAuAByntF
 51ZYuotfmBozJ23X6cvp5XaL/lN613tWYZpwXdFhPIwpPVJoY6Ztrp7l1wjSATwYmAjRbrTDvkG
 g6wz+5/+D319CjRgYo5lH4qNlFIuyz9dQo00mh9DJWikuixn60gJL5E7D3CcMkTIcKbZ2axwBB6
 2l9bDhxvx+4AIBag6zo+jvM6pXSM/dt70K891lGrCH2NS756wlhVegcywau3ItSgBQodgBYxL0P
 ZrdiSpus0cYXRCOEIVReOSr+7ThejyR/SjdmnoStQbsyXmnSiSkR4l8AjtLxVBFxJmIif/f8gNO
 L4pjYaMBslSAGRYajMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104047_549200_9E67943E 
X-CRM114-Status: UNSURE (   5.53  )
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

subject nit: s/uwifi:/wifi:/

