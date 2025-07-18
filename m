Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1729BC83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBpmOBmmbAUomiwCuJynioIMsYx/BYWfY+f6v0i216g=; b=QLzPmRxF1vDJkko9dQ8FdjmhLV
	DHsNTlFmR4ke4E7UkWzRnkc7CtxhWaB+Kx9eU12pLFYIB3yZAo+skRSDSB5NOXa4YDX2qo9mE5VBU
	LJtxM0GYZanYN0jVNrandbHdYzaUeFNxHZbHi4SVH0TWC+FkcgqIr32YoUiMGDJR3YGd+XUu0FDLU
	v+P3UtQ7hRzsxFPfux4SYnChYLKd/HSssnnUc0lTMQ1rgMAevbxaGAeL5Or4Vo1dZWj4weZNW7uSA
	OI/aHp7qZf3RjpalXAia6Hky1x+oL8nOGWzw7qHkWYIFhhz4HHJL1gXATBdnKfc96a8XC+b50PCxE
	XAB55SLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclmF-0000000Clvl-3YhM;
	Fri, 18 Jul 2025 14:09:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclmD-0000000ClvB-3cKh
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 14:09:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7ZsCP015626
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 14:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBpmOBmmbAUomiwCuJynioIMsYx/BYWfY+f6v0i216g=; b=iXQBTenyQxBmfgib
	a8UvEyM3DvOe/xPbYFeugQQ9fsJBK+aIA6lZv+J/XNE8He12v21X52yl78eVYRKu
	bxB1QevfOOQQVSli2XChoDl6zPFsb3a7BkYvzmd8yE+C/oUj8vMZ65LMJ/KwI76R
	af4HpWfoptFu0rIOxSG2CMb2pFQOxS22i7sWdteXpYDdjE0CRZRRAn4R0SYEqRdm
	G15vX2DCXkHtb8c0yBxi89h/mbmTE2F9XsDg/5a5n9mURim0nFq6SFdVusSoG3ur
	w9maP0bRFHJMPUknIZ2hZ89XhK1vnc4z4Uh2H5c+dKp0CO6FkRLnR5GZ1XsUmcyE
	zdWhAg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyxsb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 14:09:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-73e70733f6fso1279596a34.1
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 07:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847768; x=1753452568;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBpmOBmmbAUomiwCuJynioIMsYx/BYWfY+f6v0i216g=;
        b=pmQVGsEwZD+N46h/qRs1Uze8rYFX6wStd/PiXq7nifcKqIKVsbTn7J+BdlQg6BeRLk
         jOyoLJxllx6jxhZYpTncH6lBRFpLzBdcoRjghhm58xDyHdVRbyIya5dhjoiEpSyZL6Hx
         pDTB+Fj/CQfadQUtni7QteB7Lyfu75b+xH89tHniqdDeTBtNptNKlxP9/1cXgl0Hw1Sf
         077rzF0J4GpxYGFq81X0evlAPMZfb6jCpH6XrIhVYNGoOu/WJiVViatleTTox4Xo4WBD
         RGn3Di5Fx4qzM7OjdpYCxK2e5MdJH7vHJGmNYzv6TrtwDrtfiO2Y5ek8qsqUtT9dApOL
         dtgw==
X-Gm-Message-State: AOJu0YyX8/N3uL2Nd/LhYgolkF3CDSSOif/p8DfomwjZGoaItmCKZf1S
	Jdv6mZ9GdBeG73vvUt8JgnTAiPe3Yj8uk7pT+2gHbNSdf6dOtfBh4hjefAOOSivH71PanldZrZI
	iynxv3ER3RYfGIC6BnZAsZbE+0wRhHjv8ah9PGYwI9uEdz4PAvX8UsB5HM23xZv6x
X-Gm-Gg: ASbGncuPWkCWWKxcstky5Mcrox/GUheVzfkJqYIsrkPqCrwBEQkC/vZJC0GH43bLIWG
	Mjz3B/IGkyq/sjWgNbhckSJRv/jHPNU/goadotvz3TNJmgDhDZhxU+QD6vMUlxVPb348dQFm4Bd
	sC7pWoh/10Gqy6TS8dC9JuS02tYix0H/OOMq4OshYRwZ2wWzZRx2U9BL5ecfRXDDiGV7tf64C2T
	kP18nE8WpmbPTcw1IgI46syUVvQX84Wvz4g7DKNVaEP77QCUH9cWSH8sxijvaY6BxQhIlc22OaE
	XfBi8WHNEJsmiqOdGkdO2cExbAb6ZApZQ7wXnl/8B001GRFRroi7vj79HZdUt39r51v1SbsQj77
	C
X-Received: by 2002:a05:6830:2b23:b0:731:cac7:3634 with SMTP id 46e09a7af769-73e661145a2mr9719122a34.3.1752847767946;
        Fri, 18 Jul 2025 07:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwj67i55aVLzgWJZ2+fcS5oK+PpQ3DXdonq/HcYZJesrbI56S4nvsHNWoyb7g7w/MD2uBJrw==
X-Received: by 2002:a05:6830:2b23:b0:731:cac7:3634 with SMTP id 46e09a7af769-73e661145a2mr9719074a34.3.1752847767386;
        Fri, 18 Jul 2025 07:09:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83bf667fsm605849a34.65.2025.07.18.07.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:09:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
References: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Extend support to parse
 wmi service bit
Message-Id: <175284776640.2444629.31650595169743731.b4-ty@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 07:09:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: p9vZpghppRR5djx7MlK6iCOdBXewzVZf
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a5599 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mHD6CMQeyVfguiJTsNcA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwOCBTYWx0ZWRfX/nKyhCM6E+lu
 E3VA+jckBGCLiQKLNxwAga5hSfOrGKUyWUFkkMGF0LLd/FOexsWz8rMf7utYCoGFIAwQ1C0srLs
 qXzyDH1tFC7MrMiJGqL14APdfQYRk/edzlYO81LvSMUVd2/81fCUwXKo1lSvbrlvdk5zcLko/+x
 72GqsUgHMtDDqaMErJsYo3zzNWP8HPmPK8FIT9Vo6HXPQZZTQaVIUo0mqfvY0RfqzBWwnuCrwzM
 KzQLxQvS99cReV/Ma29uh4ckd1jf4vHr1SeJuM5NVwxnndDbGSuS6MrfxNbtQm0NmIouxP0MI+7
 R/qJlyQhaQPFRtWVXLIJ4VyJ0MUm7wTq2YDzIw7GvWGGaR6jMlZhrZ4KA3ts8u/b74BJXdgzh8/
 m6bXeE27EYc1VbldWdLq/zskadxTW+1pt4RWdziDcpGWt8mW7mu2xZ4GEcv2ufMQ7/5c5z93
X-Proofpoint-GUID: p9vZpghppRR5djx7MlK6iCOdBXewzVZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_070929_908648_B2750FE0 
X-CRM114-Status: UNSURE (   8.87  )
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


On Thu, 17 Jul 2025 23:05:37 +0530, Tamizh Chelvam Raja wrote:
> Extend support to parse wmi service bit till the last value firmware
> is advertising and use endian conversion while accessing the
> wmi_ext2_service_bitmap value in ath12k_wmi_tlv_services_parser().
> 
> Tamizh Chelvam Raja (2):
>   wifi: ath12k: fix endianness handling while accessing wmi service bit
>   wifi: ath12k: Add support to parse max ext2 wmi service bit
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix endianness handling while accessing wmi service bit
      commit: 8f1a078842d4af4877fb686f3907788024d0d1b7
[2/2] wifi: ath12k: Add support to parse max ext2 wmi service bit
      commit: 1a50c5ca394ab1b3a30094eda2354bcfc00f9909

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


