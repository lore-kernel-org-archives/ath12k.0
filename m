Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25833C9830D
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=; b=WitTw6IQeMJiV/oFy4qYZ1vNqn
	waW0x3dFzlwmKqGexrSAiIE9vaOAvofDqGBdJp1g/f/qkgZYOxgBO+qyL00NFsS++xbvmSOulGTlS
	vXUtUoFfFEAzGfdtPuiXT7/WPe2o1TvijujuY6RQpaGdhJYqUYPimh0qK240tzM2NT39gK7vg316H
	aulGcYxV5UQie8x+2BRxHHZPtmiQ1zjtrIyAGjQ2V/P59Txk0KOfkLZbXC+jIPxg76nsMlE9OBbjT
	94zuxcaBBg72dHcXAjhJ87TbmsQ86AkHrdaZ2yXTnZ3aVyGkN05dSJ86VEdiQh9/nvHLZwQPznDOE
	VTlCKSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0xG-0000000Ct8e-3UFH;
	Fri, 25 Sep 2026 08:06:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0xE-0000000Ct83-4Bbk
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 08:06:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JD993627522
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=; b=ZXuCqkNNFDQhRa1s
	rKRcpndxAJfUYdvmHqp9L4WiSxJ9KaPyYr4cPOOzlQ1vXQJPGB0IACXcHvKnQomp
	kLylC17M4UnuidpnDBRZvBsh79RV2BkU8srHQHHNDQ/ncpcozo+fmjGxpdJ0f8tL
	vcNZxbXmUuUf9G8qcu3OQA6jmlG9QThJ/37rPow4nukpD/VJPZmqs0j5M3Pf6Y6L
	f3Th0z6pnIRj68DFre9ZkoofV4FrQKvsSIUwXzE86+3Du/Du1nCsp5AQ7v49KApF
	5Ova5N5BRs+lr91C/eyk8pJdEcNYV12zcq344GxatFH/qkQDEtiuwGTurkJVUN4K
	eDB0uA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38fbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:06:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so2475967eec.1
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790323606; x=1790928406; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=;
        b=guF3Nlr+XHeIJHGaOXzKVLcXYtfwm0RdwuOytXjpzpQ9eov6zKbRyKMLMfvKEkTIGZ
         tFoeQ5HC4BgmnEmpSKAs66in6HU8SWRBuNzhx7MI3X5rkqwhnqveEVIdsyrpVEs+Fhp9
         jsk3kt9YVktD+W21Qj/m5BspdCYeuOCg++To1kq/X9hblsIOlpnqt67mAde4rY/0O19Z
         WGBKcCb4VtoyzV/73i/299hJutUNZm7rnsGlEhcX9arFxWGEKHe+L0pzWcyYrEejjJs9
         3i9DxpksybXUUM1T1zaPSbXs/hSMNLf/ZuwDBFJVEWhlqVHFPLIv6UVPK7r+zrv+AO9Y
         vDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323606; x=1790928406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=;
        b=YDMDJDrwrlmUUWI03Jj1ygV4F6FxAgSJJWfwB7X4HpJDVzK9C4NdeyNq06uBE2DEcn
         g/FM/6xcOU5I3Sk9AOy21FQFuBL5/gHUzUetMv9SMmjQTvt38aioZ3m9PRr66P6qghma
         K8d05GWZeOSXlMh5RDb/A4dm+HjG6g/mhTc7UldzR5YGg2dckwUVVq5fwa6GwHPxCAlU
         XyauiSwJdUwOdYs5lzwEPy+80T3sJ9TqhydYpwswTvMKBfTHpuzsy03cCMgpcH68bbSV
         Jqj2ZYCM8lbKlFKb38TQxHoNVPzq//VvtTWU8dYpl8q5YgrFxPFtC/k4lKQMjAaRyM5P
         Vsog==
X-Gm-Message-State: AFuF++kNbV1wCS8I4QwA9uVbxflglQ9vny7yNnxGHnWzp9ZC8T0A3Xpp
	R8byWjqe/PGXQasqhTWaktv/3bbO3xWJ1fbYO0Gl7Rh2SxlhUTVth3XBv7LeadvLlIj6G0l2HY0
	Y9jGrumQfOSHBqqe2AcW3UC1PHsOYq5cZR3R8zNPH29noRyCwN3iqhq31KxasyImw
X-Gm-Gg: AYBFou2aNwJHDv8YIAtcCrj8zp52NpBJjMNQHk+qVeTFoYdnDpgHtCDzU4EST7VVPlf
	8FNNaKZOGWqooezisODrGWxbRffikAHgG5Gx+39X/uVeGiBgo4b8aXn3WHkn2wFcBHyDYQWcBo7
	scIW3ROtDSDm6PZGVFjkM0T9S6m9hb6cO8V0Eh2QJYCS+MyxU8tk5XiT1TC7M32ipErXqcwvDhd
	Bh1oa3DKyKUOD3uvHs+BTS65P2CHtfCGQgO75wzlkDRwAgzI7phY4WAqwhwOzTr8IShiIstJzW/
	BLxQrGhbW1hDJWLbj72pkf5NHOrr62KOt4RSpEvNZe4tZHHrT0COi5DVsEIttv8meXdKfalz0kn
	fFyjYsjVEQuc+xJBRchHMdrI556el3OajBA==
X-Received: by 2002:a05:7300:cb84:b0:33e:3f5b:3ffa with SMTP id 5a478bee46e88-3400162060dmr6068909eec.10.1790323606263;
        Fri, 25 Sep 2026 01:06:46 -0700 (PDT)
X-Received: by 2002:a05:7300:cb84:b0:33e:3f5b:3ffa with SMTP id 5a478bee46e88-3400162060dmr6068747eec.10.1790323603614;
        Fri, 25 Sep 2026 01:06:43 -0700 (PDT)
Received: from [10.152.202.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm4804246eec.1.2026.09.25.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:06:43 -0700 (PDT)
Message-ID: <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:36:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: inconsistent regdb for QCN9274
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-firmware@kernel.org
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
Content-Language: en-US
From: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
In-Reply-To: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX0Sf1wvXGLCPn
 Wp0c/4ukJN1h0O1Tdq8aX90DZgvf9eVLpU/lOAulD6LA04pew18EpDC2C9BEd40mgXQq3qFbF0e
 WPaQx67PwJ4CNVH3MXJBU2sHCRqGpXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX2RuZ9KQl7FOy
 7pLXite57NRGrirdrGFhUmHK28chER4UCW3sHgxh1zusn1ywwqZDd/4QR5ZeWmoLvZzl8locIya
 WIgR06mhedpwzfjdWKKRRjVz0V2pF2UPkOqbNw2ovsLktdnU/016TgrFjCpEDbTSBkuQy+dSfaF
 lKGCSjY2fT1SwntF3qTo4ETlgT6SRyrc1V6vChojy4oDr7Xj5B+CqM6Axnq2XjTr0cAzkBRANjU
 2c6+QPc2H8LhltJPwvv+MCMC7J9DJB4PC78JWYkDj8Od26CFWy0g7UPeYWUYubjMcGDbxmmvf9z
 5/O0UoBEgqY0I8G54Pxwrh8yMzZCliKT60s7tkyQO3fOjRfoXt4ZR8A03SNxY4kjV5cYk3UNmMc
 722MNd6hRQA8AoS4Jqg0MJVBbszV1Evoe+K7ZEsJ2PxFPKK+Myzt1gYGhJ0H5yRs9dfhfwSlYTD
 NTXxy0aN2muQPasIRTQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab62b97 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0H79OdPNVVR_eeETAwQA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xkX1RRCC_yvAeKmxrsYBjwd2d7UEOJSX
X-Proofpoint-ORIG-GUID: xkX1RRCC_yvAeKmxrsYBjwd2d7UEOJSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_010649_177767_611DBC92 
X-CRM114-Status: GOOD (  23.33  )
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

On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
> 
> Hello Developers,
> 
> I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
> can tell, the driver uses the regulatory database from the `board-2.bin` file.
> However, some country definitions do not appear to be fully implemented, as the
> values differ from those in Linux's standard `wireless-regdb` repository. I even
> downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
> related changes there.
> 
> For example, when switching to DE, I see the following values:
> * Channels 52-64: 23 dBm; I would expect 20.0 dBm
> * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
> * Channels 144-173: (disabled); I would expect 13.0 dBm
> 
> US also appears to be inconsistent:
> * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
> * Channels 169-173: (disabled); I would expect 30.0 dBm
> 
> I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
> example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
> is implicitly assumed that TPC is not supported. Therefore, some differences may
> be expected.
> 
> However, the values above still appear to be incorrect. Could someone at
> Qualcomm please investigate this and fix the regulatory information if it is
> indeed wrong? If the current behavior is intentional, I would appreciate an
> explanation of how these limits are derived, as they do not seem to match either
> the `wireless-regdb` entries or the applicable regulatory requirements. Thank
> you in advance.
> 
> 
> Best regards
> Alexander Wilhelm
> 

Hi Alexander,

Our internal regulatory team is reviewing the source and rationale for
these values. We would also like to confirm which BDF was selected on
your platform during boot.

Could you please share the following details from the affected platform?
- The exact platform/board model, or RDP number if applicable which is
used with the QCN9274.
- The complete dmesg output from the affected boot.

In particular, please include the ath12k QMI target-capability messages
containing information similar to:

chip_id, chip_family, board_id, soc_id, fw_version,

These messages are printed from the 'ath12k_qmi_request_target_cap()'
function. They will help us identify the chipset, board ID, SoC, and
firmware version, and correlate the selected BDF with the regulatory data.

For a quick filtered view, you may also run:

dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'

With these details, we can verify whether the reported channels are
included in the selected BDF and continue investigating the regulatory
limits.

Best regards,
Thirusenthil

