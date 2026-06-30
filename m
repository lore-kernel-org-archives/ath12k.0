Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DC3C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=; b=PghtSmeVswNNQDTcdS7gu41C0e
	zwwBIJqBlUPRpRRE9tVzEh/HsI80isiFjxqpUjuJfqbsgX8Ok/ca7NVQC9/T+QwsVOMLK6gkNUdZn
	0h2k9aGSL5aKkqZQ7VnPFQOgNJNhtUMr90VrGs2M3zDyMsz40SXT3JiVGGdvVqfCAZ61/q/xQbMY9
	WbUFnddiQdd6VjH2p8bIB3kXXjCEK8yY/TNiredpP++pdi8NyxBjXB6gXQZ9aopc7YI9+7xBLKFT8
	1L1Zf1Wl/604G+myoA4IQgO8BMK7hWq8QJu7c7jv7naD4f8FQa3JfqqrPToSJSuHoHJASbp4kDWzC
	VWhyucPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUzp-0000000GUGS-0xHb;
	Tue, 30 Jun 2026 09:43:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUzl-0000000GUE0-47rF
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 09:43:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CQO31097899
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=; b=PNleNZGSVmPM7rZP
	9sfZm+GQRNYfefjKUjpUh1iDvO+2jsv4LZeiiDQ4R0DD6vTR5RMGSlTw9FABAIsg
	lS+hE7Q5FIdRD2usKDwY5rxRNuy2iEokj4Xs+TIYadDHPxUpB2MmKkC5Dg82DGkH
	T3Bad+tatwGzW+AET9HPufoIe5KgMrzejkpS7/UM7LrYhRi4MjorYpvJ3FXjTphG
	KzpcqwYtOiANauZHVhP1uPDkNmF8IcZp8Z8ibdGT28K9whBWyqym0gnSllACCy3P
	RK/FWWA2PGCccsGFOzblUdYR4kPPbtoiHISnSRx9vRh1TMeUSeXnw3wdhbujDSZu
	FpQ6nQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cu4cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:43:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso1259111a12.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812587; x=1783417387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=;
        b=Wvt7A/CuCgvlNP564dXko+7J9O/AxW8NeRVbOyvzZ0pGgLsJQ6Ve7dW/oduSBV4NBi
         Vu4n+yb1qj14JGIzYmCGCeCOfAP6IRiEf6cot/QZNolClq2uflT+6bRKsGJILRsys9HS
         ITcHqVikgNvjKjf+PlqTmG+vFf8zhf65eL4D/+yiGE3J6QW6CA8JYHoAHiuNyNqIL06J
         QplVoQyM3ay1oH6ayUTG7LkxpZlgUwssU0KYJ4YicabX2tg/fmpFvo6vlwRv5+8L59Yy
         lLenZdYjRYrvhCLIDrWXY/iUYTDtZ9NNti2Q0oGje1cbT2DB0Hp3d7XsuAphkRpY2pQU
         k2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812587; x=1783417387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=;
        b=mTPJu4X4jUjvRGZgYqN/xJxKbuql3atk7DFfy/ufgeH+YQWNcsX4rL8YsGAk1ZeWEf
         /mnKiI6ycKD0uz/N34jj69Y9pShIJY1yMFL6sYvrUtl1r2Eeu5FAIRhuhidMh3msW7Ov
         NT+z+FpSTwxpONNjvwbRSInffiTinMEiMwYeEwa+rP/2BPApoj6GlFHPQj/M879hr20L
         oaNNwQV0RwRBxpTtB/iJ+jjaRdXfiyWhVV+8/v9iiUSZE2lB4cOIp0bAXYgfXuWudyoS
         rqKxTnQXGjpbkefduE0/nbyn2JgsVvHI39Co8p7bF8Zdml+QwFqXz1MVrxMUP/Qf3tMW
         iJkg==
X-Forwarded-Encrypted: i=1; AFNElJ97ONSXgxOEdlPSHM+m8G3Hb/OlZjseZRZpqPNZJPb7wt9b0bo144yZuauplh1OsyDE5RpXwiY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwR6Z3vx6fNI/3734g34PcrPSiUE0i1D7raDFTTSqG4SnO1a7wq
	GylTikngPhltscYYgz6pdOfXFaY91SA6h2NNHrILAooOBk0VZrvD3/dw53rkiLEN2NrE26keFPy
	LLUDB0vQcCB8lajbEH7kVWy3A10x7w4af/8MtVHymg8VSTAQY+ujBYPxK9DkqFu6w
X-Gm-Gg: AfdE7cmVdbE1+pttYoKAGt9lmseSL/LOVMo+z22LOrfUjUxlbl/NKT99yvmqMq6FFE5
	viab47ZNT+1gY3vLPLhnO5fwLFi9xx2z1BbSBUGurey+soClDTe+GXUz86tDwAbodjd55by4iR/
	Zx9UIMS9V04ex7tOAmgysTcdlBlfG3ky/kq3OBbrhHlMj+7my/98ozMsrgwOWR90wSH+yw9eO23
	CBKh9VT5nMvrrjqDRcbEoVe+J4iDjPfuJHuIq77MJOoX90LzZgTyyznPEZFzI/AvvFDlmzenxhL
	mEOEzW79NyNQqYo/RG18Khfix2Xs2QWQjZW2S1g0HXyz+zgqSp6W8vMO4O52JxQqLxPzQowed4E
	UfML+ds5WV3iy7Gmr5eqkN8oVnwkPeky1k5eefxg=
X-Received: by 2002:a05:6300:4047:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfc549e62amr2736295637.55.1782812587213;
        Tue, 30 Jun 2026 02:43:07 -0700 (PDT)
X-Received: by 2002:a05:6300:4047:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfc549e62amr2736273637.55.1782812586756;
        Tue, 30 Jun 2026 02:43:06 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a002c995sm1549725b3a.24.2026.06.30.02.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:43:06 -0700 (PDT)
Message-ID: <01b3c5b2-bd31-4862-ad4b-ebabc29f57a1@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:13:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfXybdQ3bHYC4QU
 uyMgAgjQqVhcOPsGdVLcMmJD0jU5EV1ftDXOmfQ/9JRY1m0Ui1M/M6WEGm78P205KpZOn/p5myw
 tpR7xnX/k0c7HA++k/z0D33Iuu/P1d7BWczYOZl2DXHVtqv9a/cK8Zi0NXNueCADviX8Ye8SYvX
 Io+ZgMrFWS8nW0dZfthmzhK2LDaUORDPHsVx92/kmPxFvuydPCNPCpylNk3E8v8sDk37zDvq8h1
 wHdeVIlNyWi5nosb1f3ZLaA9LWOfVjgeg6XWEFAsPqzcAADrV1dJw2KIHaNWhHnIGToDSX120dK
 d2DFAUEypmVpkMutwvkGsnSAb0hCcyx1Kv6lMRKhO+GJ+vNcwlFArRcCXq6ZWPh/rYaCox7+nQA
 U4Vi7Bk+baP2gB/MSihjYu7v4Hb1StB+JzdV3oSliPDEIKSxMEPDNtc9BlpTfwgNzK7oiXsr6sG
 HZRyFiHB4HXwKvOgHZA==
X-Proofpoint-ORIG-GUID: zY5D_AffX4ftXbzYIZF9rcWEbQbaM-7T
X-Proofpoint-GUID: zY5D_AffX4ftXbzYIZF9rcWEbQbaM-7T
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a438fac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=-7ihF9cDai9aFXk1VuAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX3e2cZQXcRsFB
 sjIpROEJPjv/jo4l8taqYgsFYw/28sI8Kyhdo/UDAqMdP8JL4h52I774ZCtMqbuziLuhd9sR557
 5F5fSFFmCnxwLEt3dcOG8OU9/1K9S98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024310_136155_29FCCEAB 
X-CRM114-Status: GOOD (  13.70  )
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

On 23-06-2026 19:46, Manivannan Sadhasivam wrote:
> ath12k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Alex Williamson<alex@shazbot.org>
> Closes:https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated with 25+ successful ath12k and ath12k_wifi7 module reload
(rmmod/insmod) cycles on QCN9274.

-- 
Raj Bhagat

