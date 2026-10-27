Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BB1606A31B
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WlNwcbtB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gsc1r04c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvH+7lMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c2bGMudpaK2aZNt6kTu3J5N94R+G75Vmr5rgSyaEFHI=; b=WlNwcbtBX7R0wg
	a7md1NUGXeG2WWyCFIrdEJmMbl1KQFixWhPXUz1Ko/qkPvHwRy1uC9q+68LY/sPdf0qarevgx8xzz
	AbUhqj5RJr2KWUwKHyIfE0XtsiqC2tTNFx7MhCLZdMaRXRrbU4zqdLXOVKimNQi48KqHm6yLZp96U
	mGizeJI6Y/vr7LqDxGS6jEvmw1UMaDsdCWOtAlZppSBJXoweW2z/szKGNVon2tnJKCq3NE7l4lkX/
	7I8rc5cLRtxvkOIf9oUVxmzAnGvCrRZHjHiFiPG41KeqM3+WcPqi/7t69lwLZS6k1B44SfuzndJD5
	DrfSHpVV6jr8RYoluPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm7-000000044D9-3GN2;
	Tue, 27 Oct 2026 08:43:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm5-000000044Bu-2wWA
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 08:43:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gaoE1709067
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2bGMudpaK2aZNt6kTu3J5N94R+G75Vmr5rgSyaEFHI=; b=gsc1r04cOnOpORqM
	xk4ODxyDbtGeNphBJTIDGKUI7QCo5byls9yX+I04lQ5EsvhRmUUaLKI/4EFFAGvC
	z38lJ1WRxcv6mwO1T7HM7hFXYr50KdMGeE+1ZARM1jWuPrz8OMFUEn1VvaZnFnSg
	KeAdcBAfC+95gwL2QdwEhYdgmw7Q1X5oxymCq9dFQMvclSAI8I8rWxz14UikXlWG
	e98Cw4vYCnjqGXyGe3KD59KPqazXoxoXo7yhJVDE7f3/UR8uYPxb4CaEKb+xEV2j
	ymO1Q0DurbFdH9Twn2R5Cx+cyxABf+ipbd6/kszZ7oh6wWjjhTN+nYHqAQ/r3q/+
	0ECsWA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xuxtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:43:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4409931a12.1
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090596; x=1793695396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2bGMudpaK2aZNt6kTu3J5N94R+G75Vmr5rgSyaEFHI=;
        b=TvH+7lMQypEXFvmysHQEOg91obI/hZ9JZ0K3ZUJINU3mM98cWGagX+2l5rLad6GJof
         iap4dOnrHIpy7Am4hZ2lIAZugKcUlDZyECI8WBUcYXYYfhloOhAIkao8qYLJM9bJbEiH
         mQzWHWvR9rsN1w7Cv7ZlzbLb7FPVpbO4FA5sL2US3Uw/OtILHAS8tFK0du/UQqZdqZ8U
         olcRx4vAjYQpF9lowQZcy+am1ZKObk8oFOgttfSZ8G8tIe4WyVVB2yPC+C4N63beQ5g0
         wNJjmpHmUX442HNQmUvQvCpFlf8munYjm2L8Pjw4zhbeMz8RwFxIpKAhw6Dt/OkYK2DD
         0cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090596; x=1793695396;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2bGMudpaK2aZNt6kTu3J5N94R+G75Vmr5rgSyaEFHI=;
        b=n38FELpXKlKkR2fHInrg8upqR1REqu9cNefDAgTzn0Bqlp+A710zzzcNju9FSIqrKw
         lrvhHPLgrCnmvmc9Gh4XLdO36RlW50udR2JP7ViXyMSnNWrVUiC09Ud4RxY1HQoxYwZP
         2ZJg9i9kwx2oJyUh77CWMTiMDixNdvdKEpVMd2yY2kWQXIY+hqNGx+YPVHHMA6qasDu2
         lzvyfSiH3EqOdhZJwuyQx+j6ZWS2uS3Fc25CuNzYHoOpWTsKRgfqQ5AyzR4X7fgoyUOU
         KXZvctK7BFtAEncr7SBvTJCkk1eR3AKG3qJMPuLWUbKPuH+VQD/Nvs8fSCZf5sIhQxlW
         VlhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUe9YBSEG+UPuu8CLXv4iublUzyxe27BGqISkLPocO/A+Gmb4unuVPXtyF4N6YSU34aBRvAqQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYIC1iVjlncbp9YaCAa6DEFfg6281rw7r4tRtvn9TEK0sr6DAqE2
	+8IyMpR/7ShNiCa4Iy60n1UKI5Ji8TUERLyDzNTRg7hX8R5CzcmxfVBoYZNQgzyBBlcsTQAwtY3
	qCJwowvX9xO4QUKSgCFaoaSoY9M0Fkq8Xd0lecU8w0eR3rll2ivZW2+RVFDkl/NBoMdjWNd9gKn
	0=
X-Gm-Gg: AYBFou2qZw0MlR2yz8ILEVKYpfYuNRNe4Vq9wiMEgQF2gC4MCYkWl9kDOlVnf7MAhof
	xs3gYGfg2oUFCuYc+CRw0F0yPHHI6M0HYG+WENGqBejpaWYhl8MRKfpV5SVcndlPGHweTwLF0FR
	ByHjMON0qkU4/WLKE6FRIkURuvD5i6m4Ve5cQkx8V/WUks1QzKZBVGxeZehIJuqjIIV7lDxSEfG
	lI0oYs1CV59llubsKFw/nBHoBKG41/AAyaWV7lRJENSiNW466fP37McIGMrdAeavALbG7K9LJ1w
	D7YkiylUUpQbi+Fo3wACq9/YVaXe4ti30vwf3p7vNsIYRr3I/UwWrEQloWyeDNwimVj+e7+biza
	ueMsijW4x15uUbruYQ1iJ5H1KBETRz5ym1qts6WlkDiXymHVJCeI7yjecMlhdLBeIQKdYFgzJ
X-Received: by 2002:a17:90b:3dc8:b0:3ac:adce:60c5 with SMTP id 98e67ed59e1d1-3adeac07ed1mr7831734a91.23.1793090596229;
        Tue, 27 Oct 2026 01:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc8:b0:3ac:adce:60c5 with SMTP id 98e67ed59e1d1-3adeac07ed1mr7831723a91.23.1793090595640;
        Tue, 27 Oct 2026 01:43:15 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40651560sm2801592a91.13.2026.10.27.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:43:15 -0700 (PDT)
Message-ID: <4af7e2e8-c0d3-4a2c-b38d-553406920db5@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:43:13 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix IRQ disable imbalance in AHB
 ext interrupt handler
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: acNpm55SmBihWXSAJOgCJ3TIdVM3xkH_
X-Proofpoint-GUID: acNpm55SmBihWXSAJOgCJ3TIdVM3xkH_
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae06425 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZlGgcrqJOETN8L0HtcUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXyrPwxOnMXcnY
 lD6Dfv/6M8abajy+LzuOi94bGXPbsS//xX1GrCFKNLQ4n2AfyymG06h5TUxZHzVBh+ynMyjZBzG
 wuA73Klh/gSqw29HuyO8Cvo9ZjXh4tAnwm/JcA5/D4lLbCziA5R71IXRdxsUVMYApNzz4n2ISPq
 hKaY4b/xGSwUSQ5YUJ50n7KM+5QRimlYO3NuOJFuBLJaP43dv1c8i23e++SUl+AtozLLUamPcuR
 VL6gVhqa1RwzvgTy4js/VE42sbHfP8ZW1BZ6zu+LO5IQXCBL2xEKVFf9A2zOW+gp27NSDAHmXNY
 Iw9kK6flCc4Z8jqY/zPjugQ00DJkoOUgjoFQsroxUUWp/AcWxVVDIMzr75WsRCehO7jQdedlWj5
 fBvHXBhsmSz7nMBOQ9e9ng0RXuDDIizgXg1Kji0cGnEbMfrdNSL0QDDDRAG7k4cTs2S/N8Ygskw
 U4/I/OpGPM+vdRHxFIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX+FkjZROQPsy4
 KZdHPwyExiGtIyaMshXAxTQP1Vqdm9gG2VPWFJrXKVEsbvhR5zhuxxH+aEOhsuYpzF9qksC8kiZ
 QmaI+GRIcvaNJhz2WOUWsONrenESuT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014317_774462_90FA3F68 
X-CRM114-Status: GOOD (  16.12  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/15/2026 4:44 PM, P Praneesh wrote:
> On AHB platforms such as IPQ5332, IRQ group 3 maps multiple hardware
> rings to a single NAPI instance. Each ring is assigned its own IRQ
> line, but all IRQs in the group share one napi struct and one poll
> function.
> 
> When two IRQs from the same group fire simultaneously on different
> CPUs, both handlers call ath12k_ahb_ext_grp_disable(), which invokes
> disable_irq_nosync() for every IRQ in the group. This increments the
> interrupt controller's disable reference count for each IRQ twice. The
> single NAPI poll that runs calls ath12k_ahb_ext_grp_enable() once,
> decrementing each count from 2 to 1. Because the count never reaches 0,
> all IRQs in the group remain permanently masked by the interrupt
> controller.
> 
> With no further interrupts, TX completions stop being reaped from the
> WBM release ring. The pending TX descriptor count grows until the WBM
> idle link descriptor pool is exhausted. Once full, TX ring allocation
> fails and no new packets including management frames can be enqueued.
> This causes stations to disassociate with reason 34 (DISASSOC_LOW_ACK)
> and ath12k_mac_flush() to time out:
> "failed to flush transmit queue, data pkts req N pending N"
> where N equals ATH12K_NUM_POOL_TX_DESC(ab).
> 
> Fix this by using napi_schedule_prep() to atomically test-and-set
> NAPI_STATE_SCHED before disabling IRQs. Only the first CPU to win the
> atomic operation disables the group and calls __napi_schedule(). Any
> concurrent handler that loses the race skips the disable entirely,
> keeping the reference count balanced. Guard the enable_irq() call in
> the poll routine with the return value of napi_complete_done() to
> prevent an unbalanced enable if the NAPI instance was re-scheduled
> before the poll completed.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

