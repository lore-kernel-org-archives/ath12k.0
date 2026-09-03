Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E5C624DB
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=; b=IhzXK1UKfJwsEqOsN9SSmSC7Ek
	apz6ugr9Ik4UZEC7mEeQjlZnpZZTCMJbVeJ2i9QvofeI1INxWA925mcomhfynPlSQcVfJ/v+P1KhU
	6NkcH/pbvyHmhhXA9AA5pkWWZSn8YY/BhuniEaIkbIO59iHJtNB+bhfrGx1g4C/G8rIZrtoBlWJb5
	sG4HKRF4ZaW8l5gMit2H30Ec7pHFWTjz8YBdgKoujYyPGG+VZaKBfpQDYceNvzOwakhFLwklcxJ9j
	fbns0SyZHbi2Wtmwrm9Iu5EAF//GAJZXD4ElCAfI7LYQURoifUwmpgpl35t77jWXbkzLCEFKSLT0r
	HwbHPacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CiB-00000000QWw-2QXK;
	Thu, 03 Sep 2026 19:02:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci6-00000000QRD-1u1I
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3ASg2088822
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=; b=IZo/CuYrTpW5faji
	hWievtY3uFaYyripF76Bn2w8Y5mLeCN/vgWaf/YxXSWVIuENrDCJsqGeXlctTkAN
	JeQnaoQ/nrqogbgoUZ+IyZnAy3opIXHotBY02+BmX6Qn0m9jZt5+IfBIjPNm5Mlh
	82OMr7v+NLN8mBZoNI2frUBmaH5YBtom/1acLgXH20ajZCFAih7IYtUtfe4iTRCr
	BdVR5hay93DxsM8Gf35jxUTNcPSsMsh9UrzXHH+zgrWZ8K01iRnCk51uDuo5G8Dy
	wJK91kKxwS4P4RY9rCAjt/2WwhSfHcm7QxpuhOXFMKmwEGhvizTkn7KWD1IWWZBy
	7PYd5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b19sck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so331082a12.3
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462173; x=1789066973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=IjkUtWEHSljrMuqQeZ3oQcwH1rUYFfgQrOvY3YP9AGtsguDhuEpJLLpKHf9Hm4ijg8
         iabKsKJSTgDeWiBGd9rIQHIxBjczxQS1lcxR8vuLKgu4tH1qdxXPZdhGBuZo/15VH2Y8
         7JGVvsnknwZfO7rspbipWQ2RpqTmgZGFZijZufx7XKQxeHeEKWycE7qig3N2Hy6qSXLm
         YXBY+jyECJbF+o01xuUZ9xw3JAESKgA4uGWPgZMAkvMCN/R6H+AV5CEx+6jsr/HDIgfK
         3+KzaghiMIQgN5B30Yw8Z6kNl23sFQHttM9OGyRsttX5dbhWZZxb9ZH9/IWQ9IOELaTO
         Isdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462173; x=1789066973;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=Wm/x0rfI/lM+CK1EjGJzJgt9hw8SP0M/46FdBfY5JKpCkLT+expJOea4dqlfaMCRr2
         PzeNPP70WtxRwz0rkzbZ4aU2BzCkuVOG2Vm+I3SQ6WAKRxdf8KhDYqx+0a+ou1qkF4T6
         Mgp5N4S9n4P28ioVGCv2Am3564chZlHO6OCDNAgbHBsDsHQ/v1ltyCPPezwtC+YIXhaW
         7uZJ/E1FI1qu1YG9nCJCYeKud8o/xOBDNwap+UmGsmry7PRK+peJcr+dRe6TKKWAUqsi
         EIAL1TG49I4CggId9hT7MrVIe2YJmF/2CbgUcLMvvJx8Dny/2rvLdBTPXxM91DwZssYl
         DhQg==
X-Forwarded-Encrypted: i=1; AKwUvByP+qqWC5j9yV0VOXrezIeLd23Zkw7zDZgr19abY10IoqCqS6ZCNFTDX2NryErQhuGp3xClXSc=@lists.infradead.org
X-Gm-Message-State: AFuF++lzAw15xymQ4Vxyf7RN0kVZoAiTS/T4wIyaowwXkEZWa5sOXHg/
	Yt/aMf16OMDt3WutN6S/cCs2JwnPLj3JuZsn0wmFOP3DKAg68FEJHHZjZUwT9fsKb3ayEByyAMs
	YdrSJR6+e3nHmvG4ZrTuHCFe9FH3M2mkoqdo/XP2SxK5gMP7BguZg42+hdf6h3sB8EJPaoEO1
X-Gm-Gg: AYBFou0K6/rYZc5SLNTvL3gxD6Uw/ASqXoOlEI2mGJ5Ly4uskJ0OtNvb2c8kpX0iY/4
	nDmFtESWgAmS/D2tHvEHj+drpoZQdBrpkMxrBUNA88RTvD70XBVwKYq2hXzjmN65tRG4rqR/vF3
	vU6iS6oRzqdnU9ky+89BNgKnldO+0iqW2LlnnwNe9pnQVPz/7JxkAtDxA5PPl1HuTiKe09p9CZC
	KeeXlINDhHbw/pw4xaYNCA956Os+LEnHeguo8FZBc59MWuIM7qozdLhEOOWXlk4I1IDgRHuvRZg
	V/+Iptj9AQV0D3yWkhbEAjRn/nxx/fo+2UjEIPKZgpzDCn9nnx+cyUVDa5aCbbzrbhKpFT8rWJM
	yvuASMjvHN1Ylgd5W5DkxN4nuOrvlMIAGhaj1fHE2Y1xecsNPNdba7kY=
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794439a91.11.1788462173234;
        Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794309a91.11.1788462172645;
        Thu, 03 Sep 2026 12:02:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
Message-Id: <178846217113.824911.11446976488422487073.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Oa6T5eiAuwhDMzhrJGiyP4h-WvXKBcKZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX+/WgDk8CDlvn
 x8aVETiw0QcDtR4HJ35XHXshJbRcFMgMobitbZoQP6d9NCMxzdW2XWJicaBf/lunc/+sdyvyTqd
 8eWiXSVbTnCtvWtOuzd3i5Er4uhyTzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX7QHY8lnXxmeH
 XdwVmH2Iiuf8vYbFgnOdbNP2TjF+wMQNtxF8zzdGVs5y4W3ftsE8h54py5zVfW0m+4qd1EVf48e
 bFHKMKNxBvbtySwkn+2TRwsbYfrb97uZZYkBA0EDzVbcbVA88tPlEPZAvD/X5/CCDirOVWvylVe
 6/CV3Us1ptwXlMl5YneojnGgQkHWsuip3RfSXGvNxlvNdA08mCogyiFKb0FFiFiPorLsWJd7V6W
 qQg3D3TP4r99qM0VcBvioq0Ka+o79VdqvBx7YdZr5awRro+is0Scsp6k6oTvMwdO+4g2sIPw2xt
 f9tiYjB5FiNcNf2nyKPHB3Q2FgbN7KlgelTyOZnmra/b5Cqsky3Nfg5tFovmAGjFNhJ9j7eY7VH
 IjjoG65zxM/P8RhCZpzjyrpabOa41r5pmiFiHgbaUYij6ntihjAs9EHPlfYfyylUNKwguEPejqN
 dUzBCAkRcDIeqUeUaSA==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99c45d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Oa6T5eiAuwhDMzhrJGiyP4h-WvXKBcKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120254_499719_D8A2F4CF 
X-CRM114-Status: GOOD (  12.87  )
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


On Tue, 30 Jun 2026 13:30:00 +0000, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: support calibration-variant from device tree
      commit: 06cca100ad083609ca9cc2d1f692546369144189
[2/2] dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant
      commit: e6c2d73f27b3948cabec1017c9443fba24f1dcc1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


