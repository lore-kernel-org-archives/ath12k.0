Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84474CA9ED0
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 01:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9BOepFcQTT/lrMuwWyqaQqUcTrHIMHwmO24mO04/js=; b=rVKvzYCwSzKSAmVxnv2MmTVmjX
	n6iAuJRoPV4KkdslX9MYIlCMwCOLDJtGKDYf30Y+lzjdN3kN0vqdslBnI2tN/Ywt/B+RAKSX+Ac8q
	pA4YFIOC0jBH6Pnph9tUheR5ANFzXS4yYnLIjaXGUVtfqSJykuSC1qiH3tDkJ5z7NH1Phms2RAeQa
	KUY0QoT98L5+7erB2KYZEvewPiBFj0+p2B0iWX1udBwYhuq8TMqrIVcn+hoev83697G8MAEji54Iz
	grZS20VumNoq9hYXVDY5TpjKTKMJ3ASt329LnElOv8wZIcd4r+U3SIFQ5iYiCHgTQjBgOJBTX3ZlR
	M3XPetug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxu-0000000BjNN-2wJS;
	Tue, 13 Oct 2026 01:06:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxs-0000000BjMG-1pYT
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 01:06:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CMc1f0497905
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 01:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9BOepFcQTT/lrMuwWyqaQqUcTrHIMHwmO24mO04/js=; b=YLw2yf5Qedb5Zy2v
	5gUsUxPCOa63JrgXqKSYCq79+I24OFu9mMvF9c3KhFsnjQrATtwcI3viSxS0QOZh
	XlkxFBv/R5wIeuViiH1jKs8roezMOVKtSSJ8Mj0bWGCO9CdKTRf0LNwIBmF1NqVZ
	2er7pTe076o8Bzv8VffbVsbfdM9L76zhbanICv0uN8kjAllDCuQAbo9KH7/RU5i5
	9IkTjndMYaSVV9Q+MOBvZSbF3sgoUa5ZyZYeYtO7jrHYPVdcXdYW72RJqb1MDAKZ
	spw8p1dD6yDGiy9vlQfoI00aqbX95epWuFxcLyjajaras+Xpk3G3YT78t3lhdg6k
	Ufk1Xg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1rc8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 01:05:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14fed306427so9797952c88.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853558; x=1792458358; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9BOepFcQTT/lrMuwWyqaQqUcTrHIMHwmO24mO04/js=;
        b=A0jftVLQiUZvyHmZ/TtCgWLFdDAqRJGaBiNlUj1C/q6gMeMOxEpNw4jjZer5dLGHfX
         AkkMhCmELoNjaenO3Z5G78jiOhGDFUNq2YcwJPgXi3dZRZtBic5uEdwhKNK2C/qfhkHp
         flhtzt9Qf7vgMWzG18daGLASHW0S0cWv3Ubufep8ZZ7x9jxusBkEjHi0t0N/3g0kCgiw
         4xr8qCD2CRolqBfuu1Mvbv8AolJiNTGYKbt/REo45r+DZhLiG5Z6dfYf43agsF77Pjth
         RXSMX9hJPj421EJyKMYRF+1v9X1Agwc3b/vDfGfrj8cmDFL5frqf1NbaZgDbaTM0DP3V
         TSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853558; x=1792458358;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9BOepFcQTT/lrMuwWyqaQqUcTrHIMHwmO24mO04/js=;
        b=tiEERgTMWfV8JwTdyimD+ylXxvfFShhkpQJpUqVIj0nvJXu7MW6e5Fum4ep/JZbZFD
         fquy59sNw2zZv4p0FG9ouW4ySW2+CPdoX8ZWS6P0eZL/aZhDsC+0iynknjMhZ6zt9uLv
         pH2o2b9TEj4MSMd+A14PdDWd4HVhoqzLz9U8jGfs2t7uWe3r2YU9MECvNBrgtrTZklnH
         Ig3m7pyjGkdKN+cHPySvOsM00rdNM6C5xhfkgr5AdoV4Ky34PbweBEIgOXHlWn120qT/
         tmkcbmrbD3cG6HfQolgZL6kNmd1KfM2+YpFT1YH+0vu0QhN1qgSnB+8RnZjIOHkEXK4v
         vT3A==
X-Gm-Message-State: AFq9FYKMA+dHI7BHNrsm1CmoH/64BNCvG25zVm4k/++FOtd7Lj8GD9lV
	UMZoElACzXfx7a876gCB/Pg8PBirJsuJ4wm/Tvw+UkXQgRqnyG8GJ9ee+AvjKCrW8QwBKB0H6il
	JVSxv4vF7HJNvF91sHFphdIGWRj5SjQ1OpOs9iEDPG2pDShuZcBsy8J8BvfhKwC2o
X-Gm-Gg: AYBFou2VusgYn7honG+CKbP9Yjhs3k8RZGeH08OjgSYc7VniDziqU9zPhr532fzn5qc
	YCeyM2S+1elRFeTjJs5Y5s1cqMjqgioiFMhBPybf+0o+F1KQ/VbPPR5YqGdt064+OXfPXS0enMy
	VUZjmtRc9ZPvMHMtKhsoV9OdbogffN99jPIUWHICJdJ8XBbee1Wm63kczuDBiFVLAOvD9N23mAx
	XNf2lq9nCJiwg9K71wDBxOVkVYw0WaCxLIUed995KAVR67Ik+d+CLzo5T5q0tE+9JrZdMaOelnn
	i91GyZX7cbQp0QCJ7VhSIaF1pEKaptmgKO+znzoq6L7IhdR2PK2n8YhSSmSCepJaL9R3tenMPFw
	x5Onpk8zBpifFNob3HwTOPl6jFQn6t9Ecay21CTr6UeVA237W4LVpUaI=
X-Received: by 2002:a05:7022:1703:b0:166:b307:5855 with SMTP id a92af1059eb24-16a4ee7e657mr14800897c88.0.1791853557591;
        Mon, 12 Oct 2026 18:05:57 -0700 (PDT)
X-Received: by 2002:a05:7022:1703:b0:166:b307:5855 with SMTP id a92af1059eb24-16a4ee7e657mr14800866c88.0.1791853556900;
        Mon, 12 Oct 2026 18:05:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm32904080c88.21.2026.10.12.18.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
In-Reply-To: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in
 AHB external IRQ paths
Message-Id: <179185355440.3481009.3900302588078400009.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:05:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acd83f6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5S3J2RfQicqsIEM8LIEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Tf3X9ZE4FZdtAInetrHbnYhuvIVTvC7k
X-Proofpoint-ORIG-GUID: Tf3X9ZE4FZdtAInetrHbnYhuvIVTvC7k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX0aRRfZ+z8pig
 dlbS1QLOq8l5rGi/eSdYbLSqUC9y0jdZyoafK8Our47lvNOMv9QigEFEYuY8Cgs1PcFv3fWj/Ae
 BGMvt2dbd7s0RLqJ0pzzhr0I43NyLvM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX4Gn+fwiuh+e2
 XUZdsMm5EsAzJI4e0gh8uZjz5e5NIuP5ADM50rQxGHIlEvun7pK1gVf8lo66tUPhyv3PwcC8t+B
 4QN1dwqDVuR32MpU7njj1JwJsujNRfJ/ERYUhPGP09ILeuX+ku88GLten/f49pXBLO+hDEpGeHN
 WMPL8y/DU5ZIP4hgU9YnDNY3h0c0tOm3ntZ08Iy23ifDKRZEP2TQS+P9AYVQrnm91chvQ3OQl5G
 G+DoO0GVDOuLN/A65I0TqKsqn97Qqjnx5DhN7dZ3GufS3j4iSdBNCF5h4sYpBmORt3op2W0e3jx
 L5e72ek0dq2nO9ogS9yLVM9o68lvM1UfvN9SjXj8kUzvCqYaWhbGhHa7ZNpsGTORKe47OAcLI89
 AZxH14nKJpvP5gspSIihtr/A6g9cGErXjXBxZ5kRHc6MzZY9CsYaGWuxyHp3WRpm3bsayxamBnd
 4wOcdG4Ijj1Fg1yPRsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_180600_512919_2C4BD70F 
X-CRM114-Status: GOOD (  10.19  )
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


On Thu, 01 Oct 2026 10:24:23 +0530, Aaradhana Sahu wrote:
> Currently, NAPI instances and their associated netdevs allocated for AHB
> external IRQ groups are not released when external IRQ configuration
> fails. They are also not freed when arch_init() fails after
> ath12k_ahb_config_irq() succeeds during probe, or when the driver is
> unloaded.
> 
> Fix this by adding a common cleanup helper to release the NAPI instances
> and associated netdevs. Call it from the external IRQ configuration error
> path, probe error path, and driver cleanup path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix NAPI resource leaks in AHB external IRQ paths
      commit: ebc938ba1d5ff33652013b99c7b9a74f05690336

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


