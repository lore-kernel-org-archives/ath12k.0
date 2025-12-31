Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004FCEE6429
	for <ath12k@archiver.kernel.org>; Wed, 31 Dec 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=4rcwTm7YbRRCm54WYnr8kt0Z+t
	Wck8ztstHHJsit1EYMi7u4qFMe0z4lNqCh7sxvDAZEvg3J56A+3w1vEysSD7PY8jU8vVw64kLFFEr
	NKeOouGxdMw/F/iWDItREFyuD1kla6VjEpa/yMuJRBbVy8dCT+xbXqIJ8NyUGNCdAsVVJ5vEwdPNr
	PtFiynIAxMpe3TPS+G8UTSzmkGS5Lc+DRQpPXl5e0lgKHSogpagEaOb833Xt06lkiSvIZPFvLBsyN
	LOW6jVaB6meMfiny53/MzHPqKtSbRhhyHz0n8Z1aupylrlbEVGTXpm96VNhvkcmasHzuAZhlXP2OP
	c7+/y5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatry-00000005txo-2keW;
	Wed, 31 Dec 2025 10:55:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatrv-00000005tx9-3k6V
	for ath12k@lists.infradead.org;
	Wed, 31 Dec 2025 10:55:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV623nB2050271
	for <ath12k@lists.infradead.org>; Wed, 31 Dec 2025 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=l9LalVlHnMCVESuA
	ktNoLFmYgR+yMVeRPmZ1JFaUS088FgaON98gaUXZiHac/q7y5EeYEAVhiSnb1ZAs
	bYT+nenGTAW/98+5957nIK3Pr9Yc487SIjLLFsPE3gnkNCbWbIo3ZBBxFrTCoTdK
	khuLOhMy8IAWzxCWzztVs4hz4Kcl5cvgc8fD+mE0Mfp4uZWixQ1IaVnRZ1KWAq41
	edQTCHKA1PUAvPJLc6h0JiA83UANl8JKbLs7O3Uf0ZpoojkDqxfTTdBzgaYir3SN
	77Kp5o6ebyhoMAclhFdxW9LbhvNNHHTcT7l7pkeRIVAhRR6276p8C4+OyjObaxgD
	SQHIsA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx748fxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 31 Dec 2025 10:55:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c240728e2aso22644432b3a.3
        for <ath12k@lists.infradead.org>; Wed, 31 Dec 2025 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767178554; x=1767783354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=Fn41dL5yPmJ8/pZJnJbGwM+Yo2hCBvIzqLR+Z3r8gnP1VO7BL2uDWy5sRwVdlrNYvH
         h4JaMVTd4f2nyhopKq1pOLpKGhIvF8FigJZaQklsz2tTcUyd0A2PmEWKEPzICrJZadTC
         /uVvht/0JO8aTk3WBP2q+51RsfltARH5IADzdKhaLrXmBESaSInXV/BhZfIZXUo9Jxpb
         68GGVYQ4sC0zr8yxJ4w1HAoXYUnwPF2wv1KX/W2cofwKDphxUdS/4pFSCyBl2J3XQWSx
         95GpK7PU9HsOQy3EBwLeOIf6pxt82bXQhPaRs36u7DB6F6GPRc7FVFnLpwwQFqP50TW3
         scYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178554; x=1767783354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=Rok/nbb1tZ03QCCZpVbmG+r87k/BLRmKLEGkDmtVc7AkfRB9dLI25d5FELn8h5o/w9
         +s8S/w8Z2s/ij3WqpsiyI2LZGULwnrIYCTZzKn9u6ULD6v/jmLZppLQOyNzc9DvV3Mdv
         37N2wcjDvMHJDk9OqYebZHo48ga/YQ+PcQnndBRRsaMit4HSg4QEd8nAaQ8Z4H7DEV3D
         qgfK4/Q4vJ6Vz3r0DH4kq75zXovhqtmCoE3s5LvlA/llZtQOprPxQxyn1GBofVhiojnq
         Sz2jJ2G/kOS3I1OJ01vL+LCrY4OdvyBDmbkVTl1wALuqm+Ptsy/XIGBNPiujPOX3GZsP
         6Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZxzN0Ek2imvtD/dE7HeCHlqZJRuYRf6PjqaZSUByEcDTjMwJ7IvEyTXvFKc4K4d270CMwrM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytrj2pXrAhD4XIFL+VN1M5zpDmerw6jpVGwvAy35ryDMNGOnIS
	UGx+p087b+MHK8i+1M9+D9z9n+S+EkKUG0JlKZhaEEgtLhvoo2IbGUonQbvo1gFzesd0U0Ucgpz
	vHlNoKN3tvdxSuJByce1nDrl3FY333rxTbAVN57nHdF0Y4W7gDRNQczHwkJArOiZX
X-Gm-Gg: AY/fxX4uiJV1fZyh9yW5KrCZNlwHv/U82KzYwQ+7GZ4XGDgCu1cE8/DXQJ3c+PttUuP
	RQXDIjtYX5Algd6+0RGCA3pXJ38Pwxt8uU8k3o27q+VRtM3Xgp46qIFD7iUhexUhiLbk6G8cHZy
	RB7jjmhRzQk4RFODj7XG5ajUi5C3LhrrPD4kGCdKp233ChILLPORfeZzcBvTecum9pbzQ9mX+FF
	BbeN/77kj+hz9ghaKQ8CTYKorg3D4dBeqiY5YRXbx6Q8eT7q1CTyl7X/VGphBJLiWtH5FEwPGcr
	sCpgTF6LcUBQl1fdInCzcSfuzev5o70bjPWllmcMZKqcr07MP2uubqGEbYZwGojE+joWVWTZGUD
	cUznQBbMflugKLAl1mpTysxstKYQvKbr36MwQnw==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190503b3a.31.1767178553531;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGioiLvW2U0joeR5pbtZjSEPSozpQwlq9uIpJCK2UPjGGzU6NNfRTPRLdM9fVlDl9M9HcekTA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190489b3a.31.1767178553048;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm35616794b3a.45.2025.12.31.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] net: qrtr: Drop the MHI 'auto_queue' feature
Message-Id: <176717854647.8976.2100798756796791971.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:25:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 5_xJIeClSIhyOH7S9c3WqETSkyg9b4pF
X-Proofpoint-GUID: 5_xJIeClSIhyOH7S9c3WqETSkyg9b4pF
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6955013a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1LwL24QG6zMnwvM45oA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NCBTYWx0ZWRfX9+KbyksZEBcs
 4stWGpPl9P3kqaF3DOYOQ05tyG1tXyr1bwDSAat9sXBraI2SqiSl5S8JSvKbb5icO2jsHclt2aH
 yUQni/gaa+OX9ieB3QZkpon9znhMeoqGr7tBpK2KyoDXU3ls4as1pQ1OgLIsSfpLHMXhYqlPGEI
 yiH9mE0rXSizAxbNClwOGkbExaNf6mMXhZVHCL0pXHQoaiQyntLwx/G2yMbEQ6/+Bj/o5yj90bo
 O/emCVEG7LBH+Mry3MNtNea89GalS5cd076rUlb0HUcbgLBIF0EMisMkzVQARdeir3WNOVN365N
 7j4XSP1T8IRW3btdfYxxnNP4kItoj/z0z0jgXIiWNdqTJ1nyjqwsTIfNaOB64NtmTijKUATdfRR
 +kCdWdpfl7uKWSpn2iF66OUch+am0eTpz4zUczdsyyLkq64YoKEm/dZiD1YhOUr5T/NphfRHeo2
 K9R+r2Ig1JHdwu7s34w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_025556_373545_C3060A12 
X-CRM114-Status: GOOD (  14.74  )
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


On Thu, 18 Dec 2025 22:21:43 +0530, Manivannan Sadhasivam wrote:
> This series intends to fix the race between the MHI stack and the MHI client
> drivers due to the MHI 'auto_queue' feature. As it turns out often, the best
> way to fix an issue in a feature is to drop the feature itself and this series
> does exactly that.
> 
> There is no real benefit in having the 'auto_queue' feature in the MHI stack,
> other than saving a few lines of code in the client drivers. Since the QRTR is
> the only client driver which makes use of this feature, this series reworks the
> QRTR driver to manage the buffer on its own.
> 
> [...]

Applied, thanks!

[1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      commit: 51731792a25cb312ca94cdccfa139eb46de1b2ef
[2/2] bus: mhi: host: Drop the auto_queue support
      commit: 4a9ba211d0264131dcfca0cbc10bff5ff277ff0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


