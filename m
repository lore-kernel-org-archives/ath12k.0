Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C77E7314C
	for <ath12k@archiver.kernel.org>; Mon,  2 Feb 2026 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=; b=YwfvwtKFMcKJRDVLRP3+i1jYGm
	n+5CMfjUN/wfDfHynMigNcKpaaRMBZIDOhgAn6V7Z1lPk2Y+JRSVB/i2HXeql3yVoplKstum1uOcj
	JtEC4uCOMqhOB5XwdcXQ85MgHzYgIbR5VE2VBJ2UimwBfNZXo7/7fFcAx7UhRJXb/fYykXBxu6aSI
	A0HXNozVHRexIyI/BJQfhQqUUQl0XDi5rjkHXB9KQ1XGcWhtXHcND4M9eu7dQATChpdf7UbUKGGv7
	b9YBcS7HjwCBdzv++6tYWCE0ilLmXt/wkQ+boY8i8CC8ii6+bNuQ70OH9BkW6I1qqwg7efbTDPAEI
	KrTIEHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpy1-00000004gn7-40kf;
	Mon, 02 Feb 2026 09:11:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpxy-00000004glR-0Byx
	for ath12k@lists.infradead.org;
	Mon, 02 Feb 2026 09:11:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285PFL2219286
	for <ath12k@lists.infradead.org>; Mon, 2 Feb 2026 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eN8FZFV3v73ds3IElQVUqYG0
	lD7MUuBen0ntV/aMJC4=; b=ZywOnEcTXNX8O6U/gFHyjGPAHh21W1ZYtNX5cCOl
	y1oEsmRmdpW3NVh8VWprqk+5YEuKZL4pRJlke49qeaIGFuWpOewn03uhKLAqLTRO
	bThBjLOysL+WNYO6W0y58AbgBi+gOZT8+O1naZsDgrncCCYATnD5b27Vfc2fuo0l
	hCnlQc9aU9Kr4sACuoiBmZmy2LpLF2L0RCb+XsgJun1nKHnbz/O83eI6j9m7Tk7S
	gkJWT8+aRjDNcO2kcMYKjqHGFzDWFPN7gGv9zBQo8Ax9aYUqa8C0dn/amlWore8m
	l684gd7dMNEW2aXDlY+Rj+1S1oL3KeaRqfmWvYFN7Sja0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard4tj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 09:11:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b315185aso642218585a.2
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 01:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023488; x=1770628288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=Y1NqbrhDbPTnzl7o1/qO34jg0Av2eDdESVKoaOZ8bACa1EmgdjhIWE0XMxJ/DSIeuM
         2m14MywTIjFPKsgZUNe5LH72dsKcgSG6XrDsOuNapGqrykgrkZmabjQsXJSqmHzlahmU
         QKYpZtPvpBqH7MFnDD1elzC+kNHG8kZSkJoxkPILypfS1n3nmvuC5skY0iU1iDxxU5xW
         ezSI0tuhGLGHWaz1cqeME6G/z+5vQQsxihHmMydO66Jp0fg9FVTBlioAZNKy3HzFO0Dy
         0uupP8I0DsVbYDSnHSc6L8tg+byZQTBqsfdGMRv6jaeAqBFzKnUY8Ff86fO951ym0HeG
         XhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023488; x=1770628288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=B4lK3SxeYh9cidQeHom0Lb6BPHZvy8lPJoDMbCCrqiKs1R5lyCXk9Rdf9A61DcVDDZ
         T9PPFlVmSQLdTDifgPUIS1jAi1gscqidt4wHrLaDN0JeRcbCv4nKlKQxz6Fb2liMKgg6
         ARAz9KMMp9SH+hNjcGH9O1pe7gQr0zwwzfJfn35me1raBS+2yabEJMWtyOScvRTJN2wH
         R0PGy9fo8Hz9okNse8jmFEp7YZ18WaQb88MYIJ0+lXalx7iCW+DO9oTwSrzrFihTBV0O
         5hNhkQO963M1r1A4ITycUutpgk/jg7sUwhKsLi8zJHDuXgpDu7BfAt+VoxrJVRz92V+U
         rAWw==
X-Forwarded-Encrypted: i=1; AJvYcCU0OnglZtyLoeos+6YzlMAxGZ1B2PPf2v27521/lDsFsFYJCPVasaSauDxW4AKRe706BycXaO0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1NMedpv10H5MBXBlpsvMHu0Oj+nsq/JDH8X+Cl9ITmjv8EQOZ
	80oTB1bls4mFoYaxZgf1BzwpT2l1+iv9pCCcufA824botgkGHbeZb7dKKISV7l28brgG+16RmCF
	wD7T69WqPQ+Nm1s8lCEAUvJIE2BxzBeO4VYw3IAGbxdSBYZp8ZiViGVGLVyCyJ22/
X-Gm-Gg: AZuq6aKTyCdZAjZdgK2tmJ3xdX/BRhSDRfnYGsyR4TjXxUFRcKKN7PrOo4jnVUGJoEE
	Bq3wjlvvVJlhq3/TuEGRpQuuYlsbizfWut3UZRslrqxy2KlYbbtF2EjOdKZM3uPT0iRpxKsR78F
	8YrL9l64bR+ZkiPVuMM4xezHJAH2VCfcSo2kfIO+lkE0kQ/I+YGquH0XXyxPjc7xA4wlfFXyoHS
	O3FcN6ZvfOds+UiuWCUhulyvSjMFuF1ck+bQ9xq+EC38L4gzCodOemx1Sjou4teWUmvPGO0BYYE
	yIFgJidRvPlioYndNBg1eUUJ4y/DKMBm0i0YzTReI4Tfyu/XHzjLnsCIs/Vigq1dCZS44ceSTv1
	eA2mttE/K1/GcI/UDMgv4ObYnycg5n/J61quMgCszFa6kK79/+mHIhOM/5J0peviS2XfDR/GBot
	EVtJems/nmEZ21T4iF+bXvaRs=
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808623885a.13.1770023487695;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808622585a.13.1770023487206;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481c22sm3401897e87.10.2026.02.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:11:26 -0800 (PST)
Date: Mon, 2 Feb 2026 11:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <cwzz5ndtvkr3dqn5xr4erfdhi2pb7xjijcu3c23pdpfgnmlyvd@nuvbtkakxile>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
 <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfXxX/P+fnnmvpP
 BLtvKcgE8X9TXtbp6AV5HbtP4ZZZJwPWrJSOzpWWS8qdJ2LBaLAJBA5zDWz359HplbL4PZpZzQr
 U96lx7LZ3sWFF51229PZzHhO7NShCEeHWc4545honlgqZgD+vtxW102ZYQ8IOOnnxW36ZRXPgu5
 Z14Oboe/RKShnjOYOI68Os0RupvNQlL8WN7aLke/bZ8evvSYXVXhUSgktsXsQcJT1AoKVxeA4hs
 21oD1P/jj+Y+jitdhE4cgyyxcZ+Tkhjkq+V57rbhFZd7mdNS0Bru6EKYnH5RwgOEXdePfrp1u3L
 R7hfT33GJk/yGvDj7TE5cVtV4+edQx6tv19UjDATfYgjdh1vGZ3hDvAULPxruEUJZBYUGkGI3dE
 C8Enuem5wE7PJVD22ePD0/TnBDps2yAMkPHq4JAc3sNP01/DQOoFR5QLD772RwYs1OPwotx7oUO
 MMQ9MsjawaCRrla+i6g==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=69806a40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=2b7Me9ADDCpIAGoeTPcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VGm_eHtbl3gwxEmPIGamxKk4h4fdCOU_
X-Proofpoint-GUID: VGm_eHtbl3gwxEmPIGamxKk4h4fdCOU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_011130_192295_0819EC84 
X-CRM114-Status: GOOD (  17.85  )
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

On Sat, Jan 31, 2026 at 08:39:57AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> > Hi,
> > Here's a new pull request for ath10k, ath11k and ath12k.
> > 
> > For ath12k:
> > 
> > Update firmware for QCN9274/hw2.0.
> > 
> > Update board file for WCN7850/hw2.0 to support:
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255
> 
> These two were not a part of the previous upload, but... They again have
> board-id of 255 (unprogrammed). Why is there no calibration variant?

Our engineers clarified that for the PCIe cards with the programmed
subsystem-vendor and device we don't need calibration variant even if
board-id is 255.

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/899

> 
> > 
> > 
> > Please let me know if there are any problems.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

