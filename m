Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C4AC83F1A
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yYJm1Xs6KWdBMs0DOSWRCH6qDdlMmJk+yMWDHUJv1E=; b=AL+oQ4oSTmguNbBFQdW44YYc3w
	nGo+60nNy7ow+vyMDmfrkowg8zK3y67mIxPzkdV/vzJyz619erTpGKdUDkwUi4AL9/8DvstPpyKnb
	xbt/N54mWKrgTDmZnedVAs9ESdUZchoeCOXsvPXg5TgBBnG4tfiQWgXP5UiThACKf45dHwuZGSNk1
	uMtX1j9KwO7Adh5xfPq+eA7N2+291kI6RVy18xB19L7dnUgfoUYLbpoIhiX6F18P2CSkAy1DtuNPZ
	9C0oDd+VDORoIJJeAZbt8b87XkBqJVZfZvpWkNsjUlqYmy/IbnWICsqlor1TDIRzj6isjC+2M6H9H
	IuZsz1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEsp-0000000F2ZB-3CLo;
	Fri, 11 Jul 2025 14:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEri-0000000F2UK-0upW
	for ath12k@bombadil.infradead.org;
	Fri, 11 Jul 2025 14:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0yYJm1Xs6KWdBMs0DOSWRCH6qDdlMmJk+yMWDHUJv1E=; b=X58CBgb87HVEfLjFZo7Y5MqGYV
	5RVSiVOQKYsi03QUcm1TMqK3hPiwo9W969fypzRRFmn9pMAgA8tvW/0F1ZHFBe9NDLpF+FNy2GBzg
	UOi1ADIsLvaWbUp1HwDVGJ9ifJVyhlEp+rtynaN4S2rpm2KHfJzANkw9xBr7KRPRCyS4bXoVs/ppp
	86t8MEiab1L6jrrhTOblz9hze9YqfC6/Ane8LS7SiB8y1PHzpt+Vuxn/nkNRpGxvwe81I2iTU8QzC
	i43wRLScCTeqebOa52KCvrbihd+Gpt130T2zmLPX/DcBYgHWJP1VCO3Aob00iwszEnWHoDnsU515j
	KyPnFxrA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaErd-00000009IMi-3Lma
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 14:36:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BADFHR021884
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 14:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yYJm1Xs6KWdBMs0DOSWRCH6qDdlMmJk+yMWDHUJv1E=; b=VFdnqTh7hyXjN0yQ
	L3mwFmn76+rshZV5c0Q4n8+lSzq49Oh0H/cMJv9B1rd0SvGtlxzuCE7YFlQyKLOq
	5q/T+Drd5EqzkPprOKXlS+rSe1wcruYk6CDVGDpf1uPT17T9ZHTndCrafjhq2lVB
	RBk8gWXOX7O51fLKMcM3Tw5/7Vr0Apmo8kbMgGCLBeNx5DBKwStiiLWeihtZwYVx
	AowcK4Q2B+yytfnDf3r9rHDc8owPi0rSsvFMGqs3NxYHRBqMx0h7ZHvWLjAjv39Q
	T/l5qxCm8zvDBv1ur3fUCz7Q+a6pijFYIuexUVl6xqUiaXAjl8BdGDd7md4gp6IZ
	/jTf4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b19w9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 14:36:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3510c0cfc7so1695880a12.2
        for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244589; x=1752849389;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yYJm1Xs6KWdBMs0DOSWRCH6qDdlMmJk+yMWDHUJv1E=;
        b=X8gPvX89SXYzf+nt46HojYcFshrrZ4pZ+RiPoHv7dFn9Ca8P4EdJE1h7Du1N4pgYZf
         3Kid0zZSXK0w+CQiV1T2pbKQDECHjqPen2UdZGaANd+ZoW3tKCEZGawP/reJykamHLW+
         RdPzHNPkFt5FqLD/XPeIVKYJjcEklnehXImJv9bt47Il4sjU1f35fX3fLd7GQZeHPaNT
         LS8kq4OcHIlHleOCWCisKGjqFfcCPVhYM00pUVFo3/uRb2/b6q6HgVl/ahSmkgAYxINw
         cD1aRU3wiXhjM2MGiHdU3T/8oL2kmrgZ/wYarw+Iwm6gZOJijoO2YcKDw8BLGSur4Kn0
         oAPA==
X-Gm-Message-State: AOJu0YwbvIflD2XvTgLPu6su2d/U4NaNNZRtUAQUeEAAJcetmu5Y+Kr1
	Ej3h7z1vMN+P4yE5XJVddueibg95vEMQfIJEaqaoWs5gKp0wFKuZ54VAUWFc12ANwer6mkb/R/+
	BaCw9lrV1jsuYMK5zAaMMaJ5w/7ExoHJD5X+2R0VE0ElqPNSNyP2Bmh1g+bxYHheH
X-Gm-Gg: ASbGncuBEFujhN1iH3QTQ/A/Z/Q25JJxGj52IhornSTT4AKw1UXWum3RHTDpcFw77KM
	99cOPk/jGOQgZt6xh5ar0iwdi3aTjpRl4AwGCqHu1GBu2FxXLhoLwzfgZYhmkQNo2qeOjpSKyOH
	tNgO4sFnvg7gPHWt4DNBFll3yLC+tURnyiVD11jL4eumnehukuzge0V+/WDqWFPj0q5difNSUxJ
	au3+iim/gbeK4CjvxeYJ73bOEH/BivoQpInQdqSdVcJEYdvjwrJ03f7HOfPV+3HngP8BNitYK8f
	KLdr18Z0zCtKEW5qeT1zxa6Ghuq26IUtzuTOVtg8ePQR9GQyqtMIeloRtoFmzQZ+6vObDkZYSYN
	A
X-Received: by 2002:a17:903:4b4c:b0:236:7333:f183 with SMTP id d9443c01a7336-23df0832a28mr33198785ad.19.1752244588770;
        Fri, 11 Jul 2025 07:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ2IGUji2MbmVaeROoj3x/5OstU+J0FYQfdfbwfgdC1ILup/VJnpyOopuqa8866YtgxtupZw==
X-Received: by 2002:a17:903:4b4c:b0:236:7333:f183 with SMTP id d9443c01a7336-23df0832a28mr33198345ad.19.1752244588286;
        Fri, 11 Jul 2025 07:36:28 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341e90sm48581615ad.177.2025.07.11.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:36:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, tanguy@squaremind.io
In-Reply-To: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix packets received in WBM
 error ring with REO LUT enabled
Message-Id: <175224458767.3666374.6744524220388570841.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 07:36:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871216d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=p0o8ilPX4fJNFhDpVC0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEwNCBTYWx0ZWRfX4SOQH50WR0xw
 mvPesKLmLygbiZZxjYMBzyEvw+w/8bhfAtqkBV4/ZuRwUwnOiv1Vmkfrqu1dE7PZvK097wd90vk
 OHukEbA35O0hGPKNUrNV3y/9IbOoSHdC/tXV2SonQ+1y6VZXmOIVBt+fcWE2ZN9k4IbUkc52i2D
 xWUqpF4tMDX2LH/KZx7kEwumpQ1j1zi6zDZ+fmXsBv2reWXgi7oAc1fFrVFxQ7yXnaxRZmx2UMo
 JuF5pWzSFqRJyqfaKhZSoHLmxL2P6b1tyfcocZs/vXgDo7IkNh/DfpmvibnVOxHsEnTZ5Hd0MHb
 I0ri7SWr+4t/AZprzdFLtM5Nqw84NPaxv1/n8N3e+bAkmkZ7vah0ySKZ9SvZnT+j4NihC6HIyzU
 U1sdIYARCSH3V+n1ORpjCs3MvXoo/KwaJG7vrFl3RyNt4TpasRf1pSkDWgIXdz6trpZz+Ixx
X-Proofpoint-GUID: s-c4jOvk6iahOHUfb5nG3mvVuEHtc3RZ
X-Proofpoint-ORIG-GUID: s-c4jOvk6iahOHUfb5nG3mvVuEHtc3RZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=838 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_153638_393280_3CF010F9 
X-CRM114-Status: GOOD (  10.03  )
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


On Thu, 10 Jul 2025 06:47:54 +0530, Nithyanantham Paramasivam wrote:
> Currently, packets are being received into the WBM error ring when
> REO queue lookup is enabled, resulting in degraded RX performance.
> The issue arises because the REO queue LUT TID memory reference is
> set to zero-it's being assigned before the memory is allocated.
> Fix this by assigning the REO queue TID memory reference in the LUT
> immediately after memory allocation to ensure correct packet
> processing.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled
      commit: afcefc58fdfd687e3a9a9bef0be5846b96f710b7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


