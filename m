Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB1BC53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvMXtT1G8NnwWQRBRD5KYhitgr4PdwSykYCBd297j9c=; b=xqwcfuXDOWEGJ1wnPbX6JGdAG3
	D+kjcpMgvTix62t0zCQVNYpURc9X1Q/5jVV3+Kv5kmRMR4kAGemLsQZX6HDxTmvFejMxjRctEy5ss
	u6zO/SUSx2IkWOpdVpWXwLn5jFiCxQtlKJ2Ui6h3kKLFIzfql8qLSKH+Xp4zsz/IjvJ9JAR7gst+6
	M1yVAZi8bWrhgmRwf/WYPBOGGC9L26zE43KkorrjLWHtR7mlFTiqmn97K7FrKzYkWGS6uzTnd2+yO
	aQZysogSTfnU9L8BNm23LwyPf0xBkWz6JBLznLqZSiWLL0SJj/eWY94KfivNAxNSYvQuefnHTCbkX
	vU2pBHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ue-00000008Rlf-0QWW;
	Wed, 29 Jul 2026 15:46:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Uc-00000008Rjt-0xxk
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3FME2593219
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvMXtT1G8NnwWQRBRD5KYhitgr4PdwSykYCBd297j9c=; b=naKyNRbwpi1oyCxl
	K1gxQPbU8+ax/LLWb7XgjzmYwlHJ167B2ZgbyyQfz7T6ljmF7LkoU7xIAir+VIaQ
	QrYznVOjeK51m6HWiHIBtwckAwXmmXXSOixrGiJkcFNDc4mbApdche0jeClWQI6k
	J76OznLQE323o92xBTYo5S+vdENwMJV5p7r63rusQ4hNQr/PSGcMDdo7gvEyW3ae
	wmqxfiyt2mwWb/xzW/M1KVMEK1WQHhm8CbpOwkHKjDbFvFPqSJoyXAEtx2TM51bZ
	TBdhhawGVq/P0WEEkkwR8Oeecm29nytK25FSH2K8TnuV/9dKqTEWBy8wvp0GL+xE
	cz2blw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08euu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca3673560so19591725ad.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340009; x=1785944809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvMXtT1G8NnwWQRBRD5KYhitgr4PdwSykYCBd297j9c=;
        b=kK26XIUMshVj/dFiW4gJExVbspuUMVOj7W8+rWVy6bbXFpda3K08j4C7xNybwMG3wB
         j8c/R6eO4rEDM6HA1iXJMIxKTLgEE1FKDmNmdMsWI37batrsSXvTlfvIUnGlhlQzj3J3
         ywZL7xUla1ggwPsukyIoR4agQ1Ko5tIqvG6vNK4h1YUCbk3uRpQfTO0qJTGlx2GrBW/U
         ZJRfOhlETo0CpXZwd6NuBqWuQYNAGLVkAyzTJdm1kJNRO4VuN9ZkjnlLtnDAnZZFYzvD
         wNutIcCH5rCyXPqSl7zn1UcGt9OFz3JG24ByTPLx1x4WwvZ0zlceKlBzZqS1JCZF15bA
         BpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340009; x=1785944809;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvMXtT1G8NnwWQRBRD5KYhitgr4PdwSykYCBd297j9c=;
        b=krQ0TuJa9/7YZ4cAbJ0pQfIDY8ISg5Xc242i3RcsluiMAOHwnuErdzRG+LuK7LPBEp
         M6vO7fHpnwj92tUjwHOEweBq+52AZBPvXbZzGvlE0mDytffOg9N9nn2AGUM5p8/OaJrV
         vvR8qxe0kAq17OYsz8vX7qhZXopE0qIgHuLxi2Y4HTq/nq08O26m4ibVexHkYI+LUlcB
         dr3xtgihlbs1glWSiCsnG6vxUwziNgEKbGyyTYlCSMvuJfQAAsyIUHf1txLUs3U7glHU
         oVP2qbavqTaY0Q6tS99XWwAhnXjIKEeIK30RVXv9FbhSO6VtT+SV9I678rpzNGLi77eA
         D+zA==
X-Gm-Message-State: AOJu0YzAZU2ElEyli5gTtHiYIjNwIslPaemZwOZl+nSGNEPeXkEeXivb
	A3xeXjB+nLlU0oCOVHLlZwxeqHEBeGvLdCAdEMwkb1VDI7miwReuh1GOr2Hzb0rFIRD5u48j6X+
	deWv4Sj5Q6pHRKY63EO+SoGG7VCrwQxTLfT+r5YKspXnuwoqjR+bq/2o3NNKaMBJd
X-Gm-Gg: AR+sD10T50+Wo593AJZN6JRixVwAwZderkX4CoyqcEGn25MuaIRgdRlYzj1hgcS0ktQ
	AYcN+/3cIroBQPVCz/5nIWEB4EskJbgzxQ/RAfCrjUg17bC6pamjVWVoYJfjg8r2foUOxd1jmCu
	AChzJKaaw967rgkIRwSiluyIuyYvjCXQ2lj4ohOSCj9PeW/2Xe0aGA6oAazkoKp08l/pVLN2eCV
	uSKjpNOk1FFePCqrU3CSX/ReTNB3jU8GitxGqcG0bNEZHWN0tBlPBTkAXcj0yiFqKvGHx4oRArj
	5Reiu+3ctGPux68QAKyGHW7Pm1job+YR0VjbMrecrEx73FbVkwxHntww23Qfa+TmDY0oTTZ8ELJ
	BswDEuXbyV4Vj9CExs7FWvJIo/S3/Fmo6KwLmbvqP5UQWZT7pvIr0s+A=
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr74927635ad.32.1785340009225;
        Wed, 29 Jul 2026 08:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr74927425ad.32.1785340008799;
        Wed, 29 Jul 2026 08:46:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
References: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: skip MLO multicast links during
 crash recovery in Tx path
Message-Id: <178534000763.2826154.462337785259615514.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX3UDVRj1+sn9b
 6NH57G7r+QUaBLn8APrzpQAYjOaD6EVJ5TN7nn8JPSw4rFnYxIpTuC0rGgRWlZd+QdWOIuS8Czx
 d7h0u9DoyNUZLpRaiCKMxlB6ErpIbxuK4mFqAkxXfRHR8s/fM3ApZXfhn4GmDDihCaBvLHyql4j
 34dMGmWk6xWiwhys1eAfS84WlZ8/a1RRYwnfAiphKqzvPrsdhMT3NhLjTYl7iwcJgYORtrLkeJW
 l1Rukt3xhOl5mGik5bkqZYLVds2E7b/CHj2KPF+ygoc5xV8E4/j2zKsCD9am9xSMpXBSEkB7VgB
 XFmts8nOq37U0oCsbRcEPENmxUcWQxXaRcQsIOJVsWO/Yvp9/NFIOsoqXacQ84oJ5L69KArwpuD
 jm1i0IdBtxTNZ2Ou9ismY4zKptq7zysWxmz/2ce7Wef+iAnD+Tu2D7LiIjrvEXSXqOVyzktfjPE
 ewBf5sFC+lD5OkQIIuQ==
X-Proofpoint-GUID: T4rzT5VwitUkuVnGOfygAPY2UWRTPvS2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX0R8d0XqxIB0d
 YD/3HwcC9PiFPAJs428IMdGyHCEGeadma0WH5Qov0aW/9gHSjbb0lWjnefkG3cgH6rtVFromw9k
 Bdd80yEcCi7lystYMd5HitQz+p2Zp8c=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a2069 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3KUpPwZqX_pmD2fy2jUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: T4rzT5VwitUkuVnGOfygAPY2UWRTPvS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084650_279956_D41E88A0 
X-CRM114-Status: UNSURE (   9.25  )
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


On Thu, 23 Jul 2026 11:16:53 +0530, Pavankumar Nandeshwar wrote:
> In ath12k_wifi7_mac_op_tx(), the MLO multicast broadcast path iterates
> over all active links and copies the original skb for transmission on
> each link. When firmware crash recovery is underway (ATH12K_FLAG_CRASH_FLUSH
> set), the per-link copy is allocated and partially processed before
> ath12k_wifi7_dp_tx() eventually rejects it with -ESHUTDOWN.
> 
> This wastes GFP_ATOMIC memory and produces spurious "failed to transmit
> frame" warnings for every active MLO link during the recovery window.
> The unicast and non-MLO paths are unaffected: they call ath12k_wifi7_dp_tx()
> directly, which already guards against the flag at its entry.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: skip MLO multicast links during crash recovery in Tx path
      commit: 43c521c11ce8fe904e14d1ae0566ffea931cf2e9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


