Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B45C5AC67
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZJ76iBq0sEb39sAQgDlURJq2rVQ0TKFN440BVikQ1c=; b=YxAgz4P6DA33kHGLZ+evDR1qI/
	R+Pp5c4Kldof0gPu2TRcNEMwwZkhAh6sYIntfygZU2XKUzg2SN/sqG3rPc7Eb0G976njtep/hLesJ
	KbwVTKhejO5CGtg/3iVAJQ27cGAABTCiMg36PAVDcHlxhe0A5AU0LEuXHpwM7d8v7UtCaJXthe7ca
	mAvV2JsRk0a1eT5soMdCi06SuHV2/p2822kZyW7ODSsZXZzo4k/RI0IAr5a4dsgLc/te2Yd0kJg+u
	HWhYedjAbWSePBa+cR2LiqZjsu79Ljl428wUdZ0hfwd07veT+eUYJJAOLZ1ikhx9QPFamMOffYES+
	mOC/8a6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6KZ-00000006mw1-0MhP;
	Thu, 06 Aug 2026 22:12:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6KW-00000006mus-0tUC
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 22:12:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676L8boM3119395
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 22:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZJ76iBq0sEb39sAQgDlURJq2rVQ0TKFN440BVikQ1c=; b=H0WyIk9hs7vd/Cj0
	p1CKjudMYmlD+czCGVSO2Z2nEWk4HuuRRTKaDtgDv1+Sf0HXWy2HfG+G84ICNdMi
	Jrb0FJtA1IWmqtffRbj49JJ3y3JwbMfDPuCQNCTyXzCdYTQd+NEpqV45ZrMMlrAR
	wlzeY4U0jE9sQe9hOZEs88spjLzfhittdnI3m1LUoX2QpUTq0l64KN6hVMNHCPmO
	Pcq2jW5MuyDIoTZ3iI4MqGhO8Mv2EDIUfgIIsPdJZrkMqr8nHISBxjbuqDG+j9Oe
	qx6P1yEH/4NgkjXz6dEIBDpj1M6hI/3+yePOMtftaCwT97y+0NeOmSTn16rYF+1r
	pdSW7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s11tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 22:12:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so32442165ad.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 15:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786054366; x=1786659166; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZJ76iBq0sEb39sAQgDlURJq2rVQ0TKFN440BVikQ1c=;
        b=Pr0wcdCLyLEoG4i2HuS/CUAhowPR4WFQ5+yyufbyrdzOhI1o+bdT/8bd4N2B3j9OA2
         /bHg3cTCr+C1o52tPd5bXa0iGcFtF9WOV3TIIBlY8v58C2gDOp6VvkPQXUOmrZwULp9U
         s4SWEIwomYxxyf8PidPAbiJ6WCVn1WJ42kMv6IjnB3ThQc7sPKd3qh0DrXWQNa4vg91b
         MkLOdzYYx4zHiHsqRGhMgkpj4qu8m/Trf1hruJwWaTMKNZgxMh5nbaoenR4hirocDGuB
         114iIuh3lmAHH5c0oxtN0Y1HwKzjfT4dVlhOoh9qvA828ocXc9nAz4dpSXk3EhPqpyGJ
         ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054366; x=1786659166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZJ76iBq0sEb39sAQgDlURJq2rVQ0TKFN440BVikQ1c=;
        b=pDIV1KWWMp9HLZJQvz/KYt48gZplOUCVg4wlk5yrxJVginbBREOEM79AHQCAVQ3y2T
         HlufIOP62VA+VJbquxZhOqhTbSnLCboSfTYm7sEtRYvB0ZnCEImycx3Aca229lpxd14Q
         QPjBBBihmJt01hkDw2m8AHrSoPLsXfFoLkwtajPUjy2k1IuSCULWOHNiH6+NTGksT1LW
         LYdjIT49uYbASJYIwGS5hjyIiFSqLj0F2eJMw+W4iEwnwbLoNRrOusMXhrJug2TMvtcU
         yiiStCvc5UK6Qp+sTQN6RSWG6oRRugLpFQZWhyd+NyzCbA7mT42nnxb+sQsuonBQm/0j
         3RIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+TJ6M9Ssa9ALP3X0F5Hutkv6FjsFS6MJBJYB9pOC/oMWxgxPxN0QfO5Mfpc6VMO7GE1+zXAg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9SK4ksXxR/uoU2/9+U0dop3bid8ACK63Gf+CzV9NMuJGgCiaQ
	4ijgvPp7BTLWLdlZyBs+ccepxwMa28PE5IlBgOtjPILnaud6VkxvgZqQ7oWSjBbDJyVVNMvUcJM
	4tsu2DoonvnH7qdL00zH/3SDI+g/O0zfW1XNibYOI03wikNITN3A5S0hwOeegimr1m+BxbS3j
X-Gm-Gg: AR+sD11luLZ8mdW/7lq8ftvauD8gq4FClA6vDEbOc7CbHNaWFZ2Q6TMm9jjUKNcbELL
	YEsRIGYSNDI1XSMjal7BdwHHs2a190E855HyfeMUfQ0ze8hh26Xsa+zIM6h7hm9rK7pL5TgFuhl
	vV9o0Cdwit4GHoyOXeceP+UIDHNT8lVJF+5OxTCCDQgy4eBXLK4F8OFGLBKM2HSW13bu4SN4FaE
	Me2DV1nq5g64eqvwej6d5iWTms2srES12nLlY0+rH8x6tp/Rps1cUBwtlkz1uSA/cxRQDYUDmqr
	EY41gG2qQ7/kCWEjHwCV4LnC5Np2WmSThB20mHgDtSlcMS6YICSIsoPKIvW34dvAz86jIbcaupW
	WmqObleY1vu55/H76hkpb1kz9e68+zjm+p9k/mpKFLv+dOM6QlJSiQeVs1qqT
X-Received: by 2002:a17:903:90b:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d0ca7b0926mr224677655ad.8.1786054366145;
        Thu, 06 Aug 2026 15:12:46 -0700 (PDT)
X-Received: by 2002:a17:903:90b:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d0ca7b0926mr224677125ad.8.1786054365725;
        Thu, 06 Aug 2026 15:12:45 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bc667a0bsm766190eec.10.2026.08.06.15.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 15:12:45 -0700 (PDT)
Message-ID: <fe00014b-2255-45e4-8612-e3a7debb42f8@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:12:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN7858 data path stalls under load while association
 remains active
To: Pau.M.M@proton.me, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <C94Xarp1XxHz1dmb60Qwptbqjpu97tGKf5C5OstCKlOZ0PmhB24l_9TSWBXwvHnEz-u1TcZ18m4962yeIJchd8DUC-dzSNNp-MInd0aoXzY=@proton.me>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <C94Xarp1XxHz1dmb60Qwptbqjpu97tGKf5C5OstCKlOZ0PmhB24l_9TSWBXwvHnEz-u1TcZ18m4962yeIJchd8DUC-dzSNNp-MInd0aoXzY=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE3NCBTYWx0ZWRfXzCLjy4DBC/ml
 5lpdeM07v5CiX7L5R/99/Jo+uQ4yKtyzN8qyWK3MyNwYzkRH/K2bNu/j/VdZtlzRc3fCIEujpVd
 tS/bZtKSssaSVE2mJuEbnbcQkvbFcNU=
X-Proofpoint-ORIG-GUID: MEMq-XUORUI0jZn7EsbicIlaBZWFEYZe
X-Proofpoint-GUID: MEMq-XUORUI0jZn7EsbicIlaBZWFEYZe
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a7506df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=JSyZWIRQqG05nhjM6iMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE3NCBTYWx0ZWRfXzbVnFxtUV/K3
 1IWMZmc8nS2lWoGVvQTVW44Qi435Z4TGzTAREsz3vlENlOmnsFCqeblCEDNOMvICyzvqzlJnDPf
 IjxgMAyfg/Xe/lS+0xGvH4V+IzIqcGjYMxDcFJWAK1kVHUoX7Ymq8myinP5FgPHoGI+MNEVDoM3
 Coo9jzPSqB9H3sHGFmtcgCuqZswqd13e2qX1jeDoffIpOyECJDAJ0FC67xYfe4Z/xukiGwF/nw4
 KwmXN/CKOt+DYvHJgNQYiUSp/G6u5ov8+xVZF6GyZphGV5S5YbVhcv3FqLiq+5+RhsD6xgMiECt
 MoM+q7oDCJHgUfIhlktRokRxmBllBNoxF8MmNJE19b5haKK2+TfXnWdCBD95h9rGRfxmAHEwozV
 /+0BzxEtrk1KCnHtmxBU3oKagflElLxDbZGqBNIsm/8HmcfkL/AYC1Gf//39X5L9OYMIRxVK7sB
 Or5ESrciKVUbMklC4kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_151248_438961_4DC701B0 
X-CRM114-Status: GOOD (  11.52  )
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

On 8/6/2026 2:17 PM, Pau.M.M@proton.me wrote:
> 
> Hello,
> 
> I am reporting a reproducible data-path stall affecting a Qualcomm WCN7850
> hw2.0 using ath12k.
> 
> Under sustained traffic, usually during an Ookla Speedtest, traffic to both
> the local gateway and the Internet stops. However, the station remains
> authenticated, associated and authorized according to iw.
> 
> The issue is severe on Kubuntu and still reproducible, although less severe,
> on Manjaro. It does not reproduce in the same way when connected to a mobile-
> phone hotspot.
> 
> Hardware:
> 
> MSI PRO X870E-P WIFI
> 
> Qualcomm WCN7850 hw2.0
> 
> ZTE F8748 access point supplied by DIGI
> 
> I have attached a detailed technical report and logs.

Wrong process, try:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html


