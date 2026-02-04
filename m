Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21FBE83F0E
	for <ath12k@archiver.kernel.org>; Wed,  4 Feb 2026 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=; b=VMMmyjZM4+AX5rzi1OG++NqZ3E
	cQSxp3xeTSwnniiFmWP0yXVzXpJmMcOgV/4xcLmFY8SX/gqMCqr33mwQAJRXw65aEFsmTfAEuXUCb
	DrfFQ9xvJx0tTsBkliVtKzpUeFzKemubkoUx4YV6gEli3BD1xnITCN4stz2HjTlPSsbfLVCfv1rKX
	Eq9C6fBGDN+Gc2vhK+4cV1cPU2q9w/jy4ZBzcEVpqJb1rueCh2jdsPlaCD5h6qPeV7GcwXA126/z9
	FbOZYwyRSd5n6bnpSHaJ+HOmRcpROv9CbKMLhcpQQFRmvWI/8bxYU1Fepg4kfrNkPEeiw70JtDUj/
	ysQlGqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngvn-00000008s9l-2k9N;
	Wed, 04 Feb 2026 17:44:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngvl-00000008s8Q-0RqY
	for ath12k@lists.infradead.org;
	Wed, 04 Feb 2026 17:44:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIMGb110934
	for <ath12k@lists.infradead.org>; Wed, 4 Feb 2026 17:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aHsrfprZktYuuOp72nS9bgf3
	dwUX3nERmaLiQO3UzGU=; b=iAP3aTjpKyJyVN9ovXSP+zd1s4LSAcOI0bJXnCAJ
	J7mgXhjkuRPJ8gxgYS0NmijXtwu6aNgqSpqmPFsYgJCp+iJQaiL+rxHSP9sR4FQB
	HeJYGBOXR2VTJ7bDrOUPgibrYM5p4e37bMTVS28MMwtz4sc43Fl+sanXPuxZqID/
	xsq5Y5I0HnNOi3W4GDT6doIHjhHmHfKNIX6Nij331p0KyHcPRSsyb+IkJkP9A1cH
	pOUqtmmYDLHc7IgHXaJIfi7FOoaJup+DBCvVjsjVMCGB4zndmqyqg6NJdOmLODeZ
	cLEZ35X46RVhwVGbwtcerG/VYsBBd9CjRGah+g7vo+CfSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjh8n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Feb 2026 17:44:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a289856eso344306685a.0
        for <ath12k@lists.infradead.org>; Wed, 04 Feb 2026 09:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227082; x=1770831882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=Tbjeh/aGSNQTRtUDgeGyeEC4osZk28GfD4h2j5+YILue8fSxs6tzF0O2/KjaGPqL4v
         DqlvD1smBqKIxBSfT+zwB1Y7xYRsthAxQ2T8CitCBI2k2oMGLBgs4jeEHK6th7rVC3kI
         MqbinZho2U+zH0mjlp6qpNmtqXjcxm51sfOTwvJAefykFr5nnxMQnk6n4IsxvZNVi9QN
         NuJSusIs6lAqx2zv6h4VPZcyusT45uJhlV0Df75X/2FgvN3jwjePXM42+0CQ35ahC62D
         RCn+Y9G7gjGkumPniXtpJ7K+5mjLiHpagsqfD2jhHdrgY52himULsw1WkizJYC466L6p
         qSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227082; x=1770831882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=QZK75JNZfe6wQgvrn9NJvbk9s9iznp8m7YG8gqNlSd7tauEbYjPPPRPrvRvUT/3PbC
         bV2NHCz8bQei3q2Arn8XX4eqoGsewPwhIOywn1lzVlBweCrq3FpaVHZ/S2yoxM711qxp
         NUX0XCyHdd41b+cny2pbw6AwJ4wpD3RLMwOAvkuj8FB0Jv4L+cOev1iR+3K0XleAIWeZ
         v5MK5o0VfZhW5ifBpY6fQT0Y7IimyxD09pkW3m9lfx5G91rbhvYEDNcxolEIEKCYwU6o
         tetVtvDxmaZrgw2NRcLbvRRIb2bon2vqCJeSC4g5h/ve8TaP+zu3jR5/BtYVWvzc6mHw
         M/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVfWOhrYx8ixD5hBnjpVf8eXLFuxTSYp6y/3MbnDW+xir2wH3wG6cdj12II8VbY236ouQihvoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4AeOoksImN2IJUambo8faK3urSbEjsDnMG/1m5KOLRdEB3P4
	Qdpy+nZd/W/LRTNj03mdF7OFgkFXgdgqMQObJXFOjUpxWoL4XEZTyeJVZoj9gddOF4OjW3iTecm
	7iD07dniw0ZsT8er6TcuoQ+hiywO3OXvAlpRlsgrylxCxz+1hs3DlYNfy69ZvfQyi
X-Gm-Gg: AZuq6aJexHxRv5tiepPr9+lLnd949jHc2J40Pq0CuBzXmxdWhBq2i0skiRIPwI4RAu3
	Vn+gFJKNZW72W/DSipXD/f+EV6esBTOUDK07Gvfagep7erZxSKdVDl5smlHe3S7hHmiEbBbhUlZ
	PqEdVTE5F79LCjklK0GanNkBfwNFRAi0yGA29Ku3AydwLdT29KUg5A9V9AScy0MrzcMnh3YL40b
	xesDGz48AqReHnw8CUm6/deQOeuFNTL9n8gdwVSa6GnlKQNcXZLX+YvaFbfCU84v9xCEMv12XtR
	4og7ptDvoAJOxP4kDF3Nm9vecdngXNXz4JzRZQ2u8TGOWInp9LtZ8wehXdqcf/24iffr//fb3BM
	mDXtWL31PnYStH7jpLnCXNEJQELCVzw93AJ5nJuMjy5gYYKi3xLXWYQO5TfGyl/mVlYtA+sh34b
	Lngh41J84fkHkeHQTKlanlp6I=
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18078185a.32.1770227082493;
        Wed, 04 Feb 2026 09:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18073985a.32.1770227081991;
        Wed, 04 Feb 2026 09:44:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3912f079sm671349e87.44.2026.02.04.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:44:40 -0800 (PST)
Date: Wed, 4 Feb 2026 19:44:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260204
Message-ID: <f4smcbpxikew7b3q7jnhuvojlhtvgql5po46xtcz2hfgsgbllr@a47zk2likq3f>
References: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=6983858b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=OQxrAGhQEmtJb-q9RkkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sKmnRWHy9pbIseW2SbgWH0scdxUwegRv
X-Proofpoint-ORIG-GUID: sKmnRWHy9pbIseW2SbgWH0scdxUwegRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX2w3eB06Uwzjp
 RlyOjwT9J7ONYSL38Z1nnkvATugyWO48lprFYzEYBQevaDs0yz/i3EaNextTVCbcSRbH2ohL6mn
 i/yQ1okz0AWdjrhqTJnx9JbgL9vcr4nKPyGI9G/jKqSkvkDVHmgg+qGvNWlx1McSAqBxVnQkYoz
 SiY5i2IWxt5CfCN5JWUIT1F0hcEAl6nFFwfyL2PJtkCmtnoXmhe1Dl7nctVqq+Y9I2sNkeONili
 1a9EpB6kodD+eYdtDYc/ytTKoSoAsaQrM/vdQP3gii0BHav55Us4LFETMPNhBCGTtv/M2HxRLSs
 gA4sv7m/i0qvtQcray/q8Btpd9KHiENBf2llkQgMeZ37cgbbo9+qiEc0AHbo7gZO6m5rIU7T2Dl
 E3xT64I8dg7BUDokt6LSSExlLiPjyZr0/F1hDo48VPQerwsYi1QC/TKfg2aTPNgmTSCF7hgAtR8
 SCJEpcCkGtj1U8XJqpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094445_256953_476800F6 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Feb 04, 2026 at 09:18:03AM -0800, Jeff Johnson wrote:
> The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:
> 
>   Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204
> 
> for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)
> 
> ----------------------------------------------------------------
> 
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.

That was really quick, thanks!

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/906

> 
> For ath10k update board file for WCN3990/hw1.0 to support:
> bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
> bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch
> 
> No updates for ath11k and ath12k.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

