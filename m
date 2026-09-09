Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3221C79FB6
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S9gu/y7ay9hekveedVqwK9AwX9nbbJAw/gGWatms0k=; b=GBqKp8TP5dRJX5zZ98dsx6ujV7
	f7TL5PNHeKdiTIJ3AxM168VS7oZRCHQQHWp2IXQ4ln16Wgvs27sjbssw6nGt7XjZEUBeLNg8Ucvh1
	zr24pSvbidPf2AZuxC7B+HIH8IuQ9Yz24d2bNmR8TChjXV4Gp+RB/wTnpXVWwORUKMQCOUVSiWL/j
	rxAzWEZ5Rw2t0hAQCxHKl6LZ36CY23y1++IWeB4nb+EVlamQxm1/CxwAhlB0I1dF8/nHJ2H96xZnk
	xKXBb4F9+zkbZ3bxAgc7UBgAWho1K5Dumf7LpNWVyRECdNtUj8U0VXrtHtJ1AcCjYZ12ApKHYJu3A
	PetYS5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYY-0000000CYUB-1S1z;
	Wed, 09 Sep 2026 17:57:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYW-0000000CYRx-1vxb
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7UTO2065003
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9S9gu/y7ay9hekveedVqwK9AwX9nbbJAw/gGWatms0k=; b=CZQ12EHu9LZ6Oe98
	Sm9ZT53r7zieXOnScohRICKpzEsLAINny0jjZd4QUudBh6JkQ42tp7VmN34iQgp8
	5Kv45dQHjoECObSi76HQMRFK2cVlvz43gmJIolBYtOePdgcroSWBwJltBsrET+Ar
	W53O4V8n0M8A74mISp+uqFSHrJL4yjxzu427eO9NFnQe8tCrCYud6f93yfa97OAp
	ZXd/6kPTndsePHUhK2b8HnrOBCObXeY/B+iz1cUZZyyEgtRgceUFG8/YwSTlKyF9
	bOkEfnCeDMfMjdIw837tU9FSkSnem5bdApfZCDGbELthXrcmZBaeHLa09Ml8AbxQ
	YK4wwA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x1p45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so414698a12.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976675; x=1789581475; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9S9gu/y7ay9hekveedVqwK9AwX9nbbJAw/gGWatms0k=;
        b=iQX9lfd21pmV/ZuDA7SaGIt46Zp+by2XiOIGLgJMRxpwRgjTZrcXrZ1+GGAuzhWs1d
         nGiGEuFxRx8ktd+VT/7WOU5joi35qf5++Q6TObHKkqHw/cJnzDcpPmLMcSkl4uKK4MTr
         6ZiRT7RcoBJSzx0syy6yaAEuIDLy6J04XUbYjCIt55oKG4bh9u2Hl5r07hGmTs0BCucN
         We2i6z2e0/akgcQpHdxAkiY8qLs/8JcVGmfsadRX7rvsuyNbXZWbe4spn12eM5Xqqkur
         3i3HMVKLFEXEy+Al+EC4f12euE75hcpYTIWAiw3UlfgqvNlm9osllr6Sgw5gZ1Qm6HA3
         Tivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976675; x=1789581475;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S9gu/y7ay9hekveedVqwK9AwX9nbbJAw/gGWatms0k=;
        b=RJhO9G3wQCCpj0G83SfSXm/YW2xIh2C1vt+qUiAW8o3+1webIdBBq7H4bhvUiRzgAa
         KzKZLMGr3InGZUDL16+5OnOONcN+MSzK/TXMBK3kn4mCkQFSbnXANAgWsH2NE9xVjbF0
         Z/Efd27aB6Otjt8cNMLtpeeAbIt1caCPZyRdcVUo/N7IEPNsohMqJ9vH+zl7GD5WPM0p
         i4doybFk0EQ36p97cqNjR6kLeF/xsXc4tP/pAbj9Qdt7C45nE3HjiYZ/bNkps9FF1mMf
         /dPoFxpLCIDJTVQROLAYptErrNIy5ksBaaXG+UHFi5bNngCA0bLRvC4NDuas8ZWsn3SF
         kdTw==
X-Forwarded-Encrypted: i=1; AKwUvBxtOz+Gyg0mYQD/WibjhAgJHtCevPcC0PVUjAQbLjSbUIwdzKF/zVqBsDl5sBRJgtOdjbZVKGQ=@lists.infradead.org
X-Gm-Message-State: AFuF++k+OTCNcFCE7u01jpGGhH0IEyrQp64anHy7OYZZqDOuyTFDkjT5
	PCxY72d3WSZfb7i7fX8A3o03aTPeO7UVqRz4oM6IOg4YNrVhqoADOYk2ZAB4d8TaaiQxwFZI4F5
	xDoVhmxFOfOml6PdX8p0IRImFpzmGHng2UG925Up44gjxmCHtmJCdlwS4jOYOQ8cZ
X-Gm-Gg: AYBFou1c11xSdEql/UwJcnaTjBCOUPyay8BdwAxKp34GECzhxx5j53DfAP9dhKX4iYK
	OjIWHK0s8zQ2ShvHSOQhcmp/rtHmqwLWmsA5LT+/2dfR97sFfwApD3zEOMJzmPwu9JIpK6hYbwl
	8Q2yePJmdb09kOX+uGyneVOfze11jvg5RgwS8JbSO+cVGnGPPv1otESEPZaWjcEScOT46k9rSNX
	jxwBRV7mfajo8OaybtK1sZJuyAl60cWFoDnrKkA06s2xTYpuW63cC0uqA2w13vNA/u+VSoEmfbA
	59Irs0vhBziRGePuDyV1xMaSM67PxuEe3zkktzxAY416BUmPosEVC9imWC23HQyhCziTiH3TitY
	XPDg2AUb4gmsQYxfw1GSBiDJPD8fEcoecCiJGXoxAavcnW8vTf9YH1XU=
X-Received: by 2002:a05:6a21:460e:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3dabb1e916dmr11028578637.16.1788976675236;
        Wed, 09 Sep 2026 10:57:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:460e:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3dabb1e916dmr11028529637.16.1788976674792;
        Wed, 09 Sep 2026 10:57:54 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260818-ath12k-truncated-tx-dma-addr-v1-1-ead978969371@oss.qualcomm.com>
References: <20260818-ath12k-truncated-tx-dma-addr-v1-1-ead978969371@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix truncated TX buffer DMA
 address in MSDU ext descriptor
Message-Id: <178897667384.2048605.9756082164278318649.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 3z_4RkRMd52GgVYWZ1fGGZrElk7oHQKB
X-Proofpoint-GUID: 3z_4RkRMd52GgVYWZ1fGGZrElk7oHQKB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX+bdh2vqATKOD
 ctcpYotoIsiJfnF1qUz7tY7ox6ir3uEeMQuROlegM5aJDwXlcBRr22srJ08EbpfHaw4pyfAuPt8
 eD/GCQ/Ozxd83k80eSnONGBSCqcPYY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX5oRaQLbT5zYa
 1nqj1J45zH0b93D8jpgIJilRr+XxxGXESpSGxOcAUifNyW/A+Tz7HtiQZY5a2tGeduMUGOwKo6Q
 Zl2bDI1jT7D7NPPZctVJasjn6h7kXZwQD2vz0sBy5uD5HigcQVqWnnwO8XDpuysDThvDjDX+Yji
 4Y+BwzB3oYr5YOtfxgonwZLCK2N5bpnSF/OJhGsryLaVjYcj4tljEkdUIFq6z0tsZ8mJ08GfGHl
 P0+qMDkwXGS+81gTJfFTb991fsb5bfzKvl69cBwLIRCBmZ84ghqqqw3ZoGkRs0eXCCAjxZA+4ez
 9zDflm7jRcOr4ACTC2BQo7vpKA/Rj9D1keuPX1A97ww72uVvjmFm4r3z2RhvGy6Nh6owK79ywO+
 g0nd+QQxSV+0p5CKdzzahMP+tpesMZ5skGHSncu2bkBw9QVaWJ9ChzU/IC+hgBUyB/VTZKq9CaD
 dBNnGwvp5RsS0IwPvfA==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa19e23 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=79Wd9Z1qq7BCXqSp0roA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105756_505071_CC3C88E4 
X-CRM114-Status: GOOD (  10.84  )
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


On Tue, 18 Aug 2026 10:03:41 +0800, Baochen Qiang wrote:
> ath12k_wifi7_hal_tx_cmd_ext_desc_setup() programs the low 32 bits of the
> TX buffer physical address into HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO but
> hardcodes the high bits field HAL_TX_MSDU_EXT_INFO1_BUF_PTR_HI to 0x0.
> 
> dma_addr_t is 64-bit on platforms with CONFIG_ARCH_DMA_ADDR_T_64BIT, so
> whenever a TX buffer is mapped above the 4 GB boundary the upper bits of
> paddr are dropped and the firmware is handed a truncated address,
> leading to potential TX failures.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix truncated TX buffer DMA address in MSDU ext descriptor
      commit: 979ecb88ed3528e08dd7f87b90b029374226ca84

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


