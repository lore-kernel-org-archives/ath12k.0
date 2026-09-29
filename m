Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BAECA5FA5
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=NRVSbtWhpvaqvCCSzPjtrzH1bc
	ZSvEk8ZVDQQkrX6u2Bs5Fed0oVL5dTWuiMZPoPzpF7APcoHH4RzGiQKTUpwXN06RwWahAIfcdvimj
	H1j5Vl2VgKSPXrk6jkvAkMzvRSnupaooZjj4LwF+JIe+7HTM2T696OYQocptDNUbAcEjF6/tK6VLg
	tlP0+dzUNbRgfMw4VO02rGlUp2dXxxn9zmyyrZi6bsqlkuRO+WuwJ6h87REFft+vwylIVggoH9cmh
	nyUGRy7o8aPPOzYH5R31TJFFMkeKzM1fhU57oNCyaXxjSSHkkBoBKggHoxLcEYUMLoCZQdchrsK1l
	cO54PKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1O-00000003y6P-28Vh;
	Tue, 29 Sep 2026 15:45:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1M-00000003y5A-0ykU
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 15:45:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqgME613441
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=c5p1Xxt8KVBYsUB3
	xYluUR9MR5BVI493p1dU7/qRA7p3Uab0QfpbuGPl4N7oKSR8l/nO6hA2fqIjGBCf
	lvewgeoehd5GZNJK/lICVdtyuyjkIpE4jzq3RvlpAkpahR//80oo7pR5g/ksFoCi
	UGreQx3HnzzIuscV34pdjmOX8gTk6s/0fB2XZQDTg7C4EfXkk4pV0Oo8j5wKQfQg
	576fzBwEUJ3HAeozSCxYT80VGGTz6FzSq81y+kgVCC30AL6SALJ3fNuLVIOXL3ie
	cj3O4c06VkMJUqBJBWT/FSuT1/DbOWAhYasaT3O+s7pFUalgy2oCl180yEf085uH
	FR9wTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew3bmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso643926a91.1
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790696730; x=1791301530; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=CsR8MBFw4RzfJVDxTu6gCDvYBux/7FJozafvr76l7JMRGj0epbk0jC4nhnY8aogX5n
         o8m0AkcPNzfWGPWRq8p68vqPDckbVx6xA1qoSfIHeyPy4kgXyWMQPnlTnWUd8iKd9DUx
         CmD98lWPv1mA/hWnlKRi71f6ogVqPtGDfiC03k+JApIodVckhgERK7sflQsMUgpXFL/1
         hIsimfjeZIjSvMl2wBSNpq+08jwD9v5dE5QPXcuH8nBA5F4WC6UzVd9xziQSFJUe8TXA
         Z8X7S6n47bLIVo/QKfEs3ByT/H14G2qm4kGCcfsK8GNIXJTZnc1NveFV8qyUBYjt2bST
         Stcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696730; x=1791301530;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=RzIsHe5YVcAevfGOgz4kk9JQSJrWi4ukwJMH3tIW6GQhVGd/VoDfgU/tcOMHEUiZJt
         kzfgTbLcrTAt4YUyYHAOUK9OdXrr+1HHJZesLmR/UP60m5oxpI+MCGg5Mlr5Woi+wrYT
         x2PIMWvd5M7mR+wPrKi5Cv/R/1YLNmJmbp4ojEuaFNAZB2qmYz1cwStJBREecWP5dRJd
         nQF1oc4fSpDytq1RIS/bNmOJz19vFll1AgouI0LviWx4eNQHmOou90LmgBzIs1s+rGBU
         xmc4NByV2qV7dU3+LiLwoBBzgs8rj0/NH16k2haNeXWG/DlvPYb20KrIX8/DQPVT8UZN
         xnEw==
X-Forwarded-Encrypted: i=1; AKwUvByiytQgV/kxG3pYRnLyJbuQO20ICjLbgsCEuTObPREbvSyrgBpXO/AY/OLhf4Y2y7W1J7sfNb4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKSujtHGkp3k6wBAF8er8YrfEz8eIC5GEtnYhjvFkuZw4YbuztB
	oQ2j8ito4lOKCk+XzNi5r+Pjrmi+yiFGq/RH8YZtjHEW3jsdoo3rnYfrE0CRlrSxyPWqVaNUPtG
	vdL6Bwp1iMbl4CnAbbFseSiQCZnRwqZptjn6DYV1vUE3L8Nu1OgoCWQskicHhxG0j
X-Gm-Gg: AYBFou0nTJZk73krQSp20sffjm0dRfSamKZ8k81ScmB3GUiHLNkuwirpgM7bnzNuSoP
	99g1QnSgEfx2nFaLMrGYMdcHuj/l2LeXDmS/Pdyf4fi9PCDN/4uYxPu+eCfCmIhQpEQemAOBLos
	sSIWxAS10wBXaqHhOoJgrW3ONrx8dSWR6LkNTjDKYuZzZeSh6/K5u/g88tM3mVlibLH3e7rdB5a
	ov30XSA/UHeIL+h7Oo6d4WshdFIkZ7kG0uD2gp8LoihjxofcnfAXosZtPdb4i0Mqlx7YYSf/O4i
	hU2ecziO1lEI9TAYdIiyY48YkbNKHGNhzs4PC2fUY0tzMCQ1QqEpttHANquiVQateoRTvgGHH5k
	dA/Qa56Bwhk2ujaE13W8LJX1SIMfM8QONeH2dwzHLzMSMMcEINm6i9Mqh2lzr
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145145a91.6.1790696730261;
        Tue, 29 Sep 2026 08:45:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145110a91.6.1790696729652;
        Tue, 29 Sep 2026 08:45:29 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91458e3bsm59366315ad.68.2026.09.29.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:45:28 -0700 (PDT)
Message-ID: <fd24a99d-e8f6-492e-a71f-d35188cf41d3@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:45:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260929
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX1Fl2lx7n6wtD
 lP3FSq+0r/MPfVGvfHFrRosvybYNS5avdVmwbAXdTFXxsWHWd8N2LaV8h3HO1BlYzeAbrVGhvUz
 aUv8+9W+E9CoZOcLt7bEaXD5mdzbUco=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbdd1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=m8tp9wjG45yvVgdVl1oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXxlKHgUyzlQlo
 flYLMeYSmsES4oPP0l1l/1CI+j6GJkH4M5aq8xaR/JXRvGv0bcPZVF6z2qoYE4p4iyEpQgx9nFA
 jQ7DtOusatnKq+SsknsQZgpDEDzS4JW6YqDZZBAlcHbqoASzeTdoy2NEsp9X1IXCex5jqV4jIaJ
 Vcar3v4dUp8QWR9cVCETRtEtCe2oI8zNPLCyiZPqLMOy6Ak0qUmnXLge/ZfEPUTDyAKr1PlryWd
 KlBEttjJcld0zY/slSIfogbyR+l9gL9RBr8IoBJao2svxYWQ5QrgWFchr2trbKAamY2Pd+rsTTA
 HjA3mRzmSnun9u31Mrm5Eu/ByiptayyO7BlGIBVIV9pDLlC47ElWS18vlPzDnKYV8QadNwCM73i
 kexW8FoMm7zMdoxchSLJZ14wtxI1rgrkuQR6rFsrX8pkvuqLvEbqPex+aXtUy8948uqM4bTtOBN
 ZhTNhDKKxs2Y2fm9n5A==
X-Proofpoint-GUID: 0p-dMETUfwVKbKlgiWno_SqvVl284lBb
X-Proofpoint-ORIG-GUID: 0p-dMETUfwVKbKlgiWno_SqvVl284lBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084532_386788_6CD21D8C 
X-CRM114-Status: GOOD (  13.72  )
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

On 9/29/2026 7:58 AM, Jeff Johnson wrote:
> The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:
> 
>   wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929
> 
> for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:
> 
>   wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.3-rc6
> 
> In ath11k, fix an IRQ imbalance during suspend/resume.
> 
> ----------------------------------------------------------------
> Baochen Qiang (1):
>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
> 
>  drivers/net/wireless/ath/ath11k/core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Please drop this. As you pointed out this fixes a patch that is only in the
next tree and hence the fix must go through the next tree as well.

/jeff

