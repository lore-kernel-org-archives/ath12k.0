Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B8606A32D
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hBrLICVy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7pVGVLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=; b=hBrLICVydxJBnBPDUZDfw9DHQ9
	UA8gR25f5Zrrl8wyycn8xarHeN9vtJiR68eTCGAMARUZsMfQBTB5HjScF3vj8EagBeFpSLDKmouCk
	J2iDPCx8oEqlwHPO7HCx4cB1fHXQYH2DZUGgClX374fHJgdmdpX1G0/ZwC70fUIiEkr/2MM5LYXWe
	jQiy26EYyQt8FmBH4Hg25IJJwnHm6oGGViO2tVAJkiO6Ikp4xdN7QKmBfeTRt7/InAXQHs0Qugudf
	Cx8XgYpihsyUq7UX0jwxtbm6phUrQI/IItMWgHwqxemxhpnhg8ZKAb1bjhOCo485HJV91fao4HrD7
	MLtneMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVJ-0000000CSpZ-1TQK;
	Wed, 21 Oct 2026 16:49:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVH-0000000CSoT-1qSC
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:49:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTxtY1481037
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aScArLj/kav6iD0/o6beXEYz
	xhtPHu8K7/dEbQLRbs8=; b=goC+a4OQMFZvZcJVwwGnrmMdn+Hw/jb8LweDtqux
	Ymthk89zZy8ibRIh2OsnxcuKrtrteBnDQahcx5CYa18x3UcZr7yyPQCWwzPt492p
	T4YwA/ZJowbdD+/HjUTLfXtZbZqN6oMY5kLnanhl9nydCQ8gFT6QbLEOUrTdKdKZ
	IXbxj4mkUZfhTNSqFtMfIKpO+SVuD49VXv76OCFtZ5BbtaJc9PbHBSdTiKYMNUwZ
	OoHe7unYesBmOts0ZNBgz8Aw9214R37v2egEXSs/jwlopYBHSmEKXRaXxOxOQiYy
	cpWgSr7P6W2FfurS3kYLgKvk+TgBQCB+fw16CdWXqluFhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs049sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso154957085a.0
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601366; x=1793206166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=J7pVGVLwnB8z1l1uOOG8s91fM/pmaO0IzPOHh+k997BmufBkf15tFRWHf7P9aucHws
         8FOQZP8HzqMRof2v9ahKsrct3lvYCkKS5YZxOwSFBqN1mLcbmBioPqbzmzvnS9QLq6An
         cIJ6t9SAqSNGlM//dcDZ4KHGW8HOXeqvjoKz7XV0xAOwPTvRvCxnFAAgp/TwwiP2vYJF
         /AV577tnfib/ao8fN/6PDq9zt9fcJffYhHSTM/z1gISOcjAlXW3f0XpuhRl8ByQY74dZ
         YD5Ps9loklALTxbXz/fkHatIu9vmTHx/pCR6ocCeLeUieSkQbnSBMJTrB6wG6vuUI5WX
         2/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601366; x=1793206166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=lFsfJU2/wKiPtaWJwiAsN29DRlAboJcdFbLzHZXBhE5JhWbLebexFaTAYJl9b3Ylwq
         qH2Xjx3Sq0FEB//Pa2fKHkh1VK4EXE8EN1hGgzo//jYM8Vo0QeoLVDxEsd22qRhSOwHg
         ivlHFYP9Pd5uWLtRBZFfEKUPRPGj61oXp2EzAzQp2l/6E6yJf2Ot+78DInCs3et1eGan
         Ngp57kkz0u1W/1YQVwUfVUdTWOJcbjkkqe87o1aRSTAxcJkJDj10cm9HPQ0e7AM3CKGV
         zG49F2RxYZ5ZEkd54hsPOkJLQWTglAm1vz4JJvMoiZvd5ml7UJzR3pJ+rVzhGPOpUNkR
         q6lA==
X-Forwarded-Encrypted: i=1; AKwUvBzBb1c0ku8UNQ+9zjoWWjjG0xsc/WwLj4BV0Kv9i45zVxTWfLhCXXYaxPOMoliS7VrP88HlscQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJPiQIVlx0Fd2zFbNm6lCPGDWd2zlvNBaAU7pCK6v8ZNpaqQYBj
	8xhGiyKWNihSHPfN0R9iQLVBGuaZOl+KzJyfMS0+ze4sP4nDPi8q72g9wYQNoB59mFk2aWW0x1I
	7Xr1i+oduatN8V/ZCeJ7Fl0ftuxJUYoCxbTfLmswh+PbDYhgcyf6Fdsa1W7jFpKFt
X-Gm-Gg: AYBFou2ZJLZLDh+o9LLCmfQNQKm8VHYHfySCYu+8U1rEe+NeNtkbEc6zmJ38UAOzJ8a
	rAKCgxOmmEAE94He62a9hnT9Zgt/bV112XmuDMIiYKhSXJ62FZBt3U3fdDinaI8EUoAyYMx2Ith
	aOqZutMZonyrk5Xnz04eybeAu9CxKmufIIQgHBlwDEyeuruL1LjPah6wzuapmzf5nZCJdQBLkEz
	2HaVA6go1B8kGlRw7cuMAloid9ubMDZM2XrZouYDJJ0Rqbgjg09oNPF1wxAjxnibyOhrgSIxDJ4
	kXJb/8Aqly2lziIkICv7/FQqVJv3Cqxjveoj9QJsHvZuNsq35RiUMvEyudyz+16mIp6Jg3wZS78
	aUIqL1Vas7GACFNNZtQ8o4FmXNHXUQiAxvhynqrxdhMoCzm62SLHYDlYxzwCx13yG5oDNT4rr/f
	tjb0ctHiCJTKRs
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541416585a.20.1792601365673;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541412585a.20.1792601365178;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df158sm1332271fa.2.2026.10.21.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:49:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
Message-ID: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8ed16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Cll3ooqCA_IsHNaTrZ8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX0ECQeHvaV+P+
 rJ7ORwF9HLkKpbbmEhQ1MLG8DSnGPjuzWkU7yB/B8aVF0Glm4dHakN0YdcbL8DZp49UR2OHYpD3
 WlRixGbsEHAYo+jWfmnjTgw0VX9g6JyjJMiiq328tzYKZix8UNhGLm3JAsWL27XO+pWlNLoRgMQ
 bdYA08rAJ1MwbWeEViSt/4grlo/LcH/y78rh8vpaF0LtncRrAJ13dZx70oTUs/obvJD+tPA32xz
 nFECxO0hx2q0O5KaMrmTjJjW0e3Iv/rgM8/h/ltuaKiKCrg1BcGU9CiYYrMpgN5ytO7W4aGYCsI
 RhNr3czOyS8DF162Uo3QWRyIRtNj8imqVfQYk4ord3ZQn88KuamMjMKSiDQoMcSnWTW0DPTEv2+
 +ovyIPNU0XTLyvEqfyL4PYnv6xWZVIIYXFidLB2inSQ6So15qopby2Pnr/Gjw5jzn6XrqKsoydL
 XI3wtlwZmwtflSDWoKw==
X-Proofpoint-ORIG-GUID: F1NNnWIJH5UvQLzZJ6MPy820H8n64PJq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX3/DwUxrIUNA8
 tHK/4Ec0vlFsi0qTIdWLJG0ZuDb6ey0dX5amrHVYE5wGuvafd29/NukriWcjSKJODawUWnrwEA6
 sWN7+90bt67+eosMpf9qRVTrNjZud3A=
X-Proofpoint-GUID: F1NNnWIJH5UvQLzZJ6MPy820H8n64PJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_094927_621227_1ACB7F69 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

"make check" failed:

1. Missing "Signed-off-by: author information"



-- 
With best wishes
Dmitry

