Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E9C54E65
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8pfrRmMMPxVsgesSad2JR7BoMNnIt88nEFw4z/RGv4=; b=IJd8HE2mBoE9x441znzbA6SUgp
	/CX47iZqi1ngzzUMbwdXQoNP05Jza5zoJdz+Wr5kTaG91EbUwm9ZrPokHzim5G9NVnMijyQ/75Csp
	N7qVO4uCTUxuiT1VqVe72UIRbcTz+02oBDqsi75XXiZpQ0Eu0ThPlrJrUKVfUwVGamUSyFEMkGkDE
	+0831cwXfOqJOsoqiHxhbJAJOVHsUrTNUb2CJB+Bb2hr88cK6dC+dzQhHah4Je8cflGpCQ00VhUf2
	kbgWvLy/SIQD3bQLB7sfFtT98P8GQtviSTnQWWnLxuB0tsLQ2lB8gENIfgnqYF63Cfq7lviacrq9q
	yr7XM7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHqcX-0000000Gq6S-0AMx;
	Wed, 21 May 2025 21:05:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHqcU-0000000Gq68-0RtU
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 21:04:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIi9bk000862
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 21:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8pfrRmMMPxVsgesSad2JR7BoMNnIt88nEFw4z/RGv4=; b=MxOxmSmhhtc76zDd
	VKjuwHqbDF6Uin5xc7s6h6CGg8yQ60YMNrG1K2NzR8FRMlF4iUgesDqiSXtjMtL3
	SLgI52SSqY0+qCSVE6CkV03TWvjS2zDeAuUeUGxejWd2eZwr7ecvidDbizLx8CSW
	bioeiRTAHUpBAF2tfdZYf9hvPLSKrzbvuhc0pFH756KVCLDR1B6tonfuEYATlaND
	f+G54wYaGpxRRLjim5DdvUbMV8ahL0zglUFGunzIddfyZVEmC5+D3tsTMvse3F/o
	aRndXbL546InDhxrXekGM48/U5smAIv+gbVjOOqwzRwlnEkXyH4qBz1yJV2ZFJHf
	8oTjRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6v5wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 21:04:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7391d68617cso6229440b3a.0
        for <ath12k@lists.infradead.org>; Wed, 21 May 2025 14:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747861494; x=1748466294;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8pfrRmMMPxVsgesSad2JR7BoMNnIt88nEFw4z/RGv4=;
        b=py5O5RXlW1K0Gq5Me3P5ArGy1xu2sL38dY3noP+V452y1FXwvd8QXN5bo2nh+ELJbP
         qavI50lDz0k/jP6LyXLUpAAtvgvuSPlSJO2TUCWCxD3n8FL99/cLIJSlXCzAcpd1P4+t
         tLo8ifmTd2ujO9BjQTj82b7XUZAfP1uUZob40H5CBa1joTmXeGf255EqqNRuvsUNC3BI
         yklBm20kVuq4MNBdruMM1dI4NrQiccNrmVPjTt3IOiglOboLI88M0IgRzwDhSpqNT5uK
         m1AT4MaAIKRlEUmHSz7G6gFN9yJMXeeKlAYiQLxISSQwCchVISDi+h1grQ4Xs1Fe12hR
         rhEw==
X-Forwarded-Encrypted: i=1; AJvYcCXROxwE/Ydo9AxQ1pv1MjUXYpzy7UfdGYjli+nAo+9wYPpGr36MEVNRz64/NpAtAJ1vZXjaBzE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVgqtPCQ1mVUd6VFJeSUFZ8sulg1WgDpYnNXOPT+JmMKDhfjc9
	nlgAvVC7ncVaLf8vJPGOg7+26Vopl7R6F0iusZkBbdTmQ8IX8oBy2xQxXVgmMeZZTz/oVE7V0hN
	bnOMnIZEGp69eF6anbH6304ry/priMbBn4CVhLUoVkLNeyViwmlnH6u1XOuX8PsKQ
X-Gm-Gg: ASbGncvK4kvDsWjVMu7CF1cvbkKbsdYOXtF2iRTqPEk+4K/qdPnJ+AQ2KC2suM9KrLy
	K9HSo8fnGbU2wHPBhAxUqLQf7Em9GIdmwHLHkWza1SLADPm8IYYWs2gg+BCShzf84U3nJldK8wX
	tYBcXTekjXazaZJomkDy3HvQ6gaRwtH1MftWu29gWdUFS/zWzdhQu87Nry93WExn0LpHV0TEd9z
	NPIFCAC1/hFtiCZjrEMhFGhcZ8KU/ELwJY6IZBZbDUnYT5Er8kLP6XiYvlyCAIGu8/rh/0IWX0L
	z7nBQ1+EWHc5jrO5vmlXgg61x/aJ+JaMZ2cRAvzpNKjfz3fZ
X-Received: by 2002:a05:6a20:6f96:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2165f87234fmr31590432637.18.1747861494492;
        Wed, 21 May 2025 14:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwyz7dPN3iVMEKuZm00Xxt7WNxKbvIPZRXOMsuu9ovK+uJlYmywLQxhYU5YAUcR5aa5ssk/g==
X-Received: by 2002:a05:6a20:6f96:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2165f87234fmr31590380637.18.1747861494053;
        Wed, 21 May 2025 14:04:54 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b7f3sm10057303b3a.87.2025.05.21.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 14:04:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: fix several regdomain
 update issues
Message-Id: <174786149316.3123854.11064222745292053302.b4-ty@oss.qualcomm.com>
Date: Wed, 21 May 2025 14:04:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: LWRlxKg3V_AtUikha100OYwRWXOzMZNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIwOSBTYWx0ZWRfXxzgny2B5eR5S
 U8ANqDNrUV9CShJFtrxcqrrfX6s8IPW88fdj3Z1OgmGp1MGiXyGYdHfTZvRYyi3RJuxTV2DlHOk
 nInIh46VTSwWWvGq/SLve/E08iNSAPAXwaGjsOITXYnI9tjdmjCLOH6Aj1H5EfWasKyqAIgi/X7
 rgwxfMG2q0WOf8v1mIR9irKqkf+NgFwp43XF9spKLFB6QJyR6M2WCOwj/Skghlv55thMqq3zBCv
 m2t18LBS6ElZzbtWRiPqU6LKG72jMCHpdbpANXazKTcZiMHx9jdm6xkVmnmZX5+MGQH3xj8dzxz
 CqlNM5vfuaSu64+rKhlZYlTj+RuP4LNpMRiyrSHatCkqId5wBO6uZ8T/vBcqLoAHLmsrVSMX0pP
 1T7mY1y9O4bJc9gbzCzdcuf0cuw0ws5tXVsbWha0tM48gSJ9gnH10k65EQHeBZ0jEfbsKIka
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682e3ff7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qE4HOfYLDg8APkTHxjoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: LWRlxKg3V_AtUikha100OYwRWXOzMZNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_140458_285189_AD966BA6 
X-CRM114-Status: UNSURE (   9.68  )
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


On Wed, 21 May 2025 22:29:28 +0530, Aditya Kumar Singh wrote:
> Following commit 4c546023d71a ("wifi: ath12k: update regulatory rules when
> interface added"), the WCN7850 fails to connect to a 6 GHz AP due to
> ah->regd_updated not being reset. This issue is addressed in patch 1.
> 
> For the same reason, regulatory domain updates also fail during interface
> addition and connection establishment. These issues are resolved in
> patches 2 and 3, respectively.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: fix regdomain update failure after 11D scan completes
      commit: d662c14a51910ba0ad66afd248b601ba30b9f7f1
[2/3] wifi: ath12k: fix regdomain update failure when adding interface
      commit: 37e775a0a9d79a031d28d9e21480f99f448e9215
[3/3] wifi: ath12k: fix regdomain update failure when connection establishes
      commit: 886bb3624e4c9914a943b63fcfdf30b8d2f2b66e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


