Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E0C9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EBl2dFsWiMsFSqUAN5NQylf+8ZNg8zQAaPdvj+WmO8o=; b=qJLjRWPjqfyTqq0wS8jP/d2H0m
	3nxXS+9QZRK9poDwObZeomVGVWI1uZGPVhL++ChsLhRXRLZFLK4SDunCexFRvw5yy8/DYDqOEkFiV
	1VOMLbf9G7M17q7P5gjqwHRnK+3k5sZZqAPDnkLPJcf2ubOxmmRxx2bsFtRMCLIb0sF7BjHoBSFZ+
	Se7SspMLgk+FHPBr2DTT+m/KHTEFmsVpPtpxTl4fMzI3boHU18Pf9bZhgNdYFhWgVYsIyZkHkAHwH
	1A/VADoIP+22UPGtCDzEnOfXkewbAglZygch9kOSj85w5cXervHhQ7QdL4bOfDorAbHOOZoFazlla
	+mb7rJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8JD-0000000DsKu-1AgS;
	Fri, 25 Sep 2026 15:57:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8JA-0000000DsJc-436W
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:57:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8RM425745
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EBl2dFsWiMsFSqUAN5NQylf+8ZNg8zQAaPd
	vj+WmO8o=; b=o8AcaWl3pzLm7MttTikh/ZzAMiyEqPkxid/F2lrgp/UB/VlvgSU
	LfEQW+w+JPZ6ufnUF6kbgpilPCbo8SGf6zf/4VN4jV6HYSTdHbDjzIt5tcOkou/n
	5z0aqkPkcHX2XuGrHSxzm2/dUpDduAet6l7J1aIYdU7kzbKuKYT2sMa9aAsKsqWa
	/9ZqppQitZ4ALWqInj/J9j3lIRpr1HP/vl4rUzOWwyf1AYkB8mhd4qxOqHakYv3N
	Ilon22rLMfQM8JUO1SzsSEvaicmV8JOLgGmeIcE/gC+tNJcwZsAbH/lLXJBlI6ST
	ZOsRheDYR7yKt7UFMw4ty3uhPa7ukGPUjAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8xya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:57:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18880so921864b3a.0
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351875; x=1790956675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBl2dFsWiMsFSqUAN5NQylf+8ZNg8zQAaPdvj+WmO8o=;
        b=HY9adhSiI5ECynKK/FAsmeuN8FuspJAjI3r9Tg0Uv8AgTM6Q34+WcLdiVR0p1n/2FV
         UFmec+iA8CaFqJb0ACVSrBY7eR1PoruqtW9NcZbu2qWcqQOvOnKfckGi5WgV17ZvoM9A
         r1nNtOCrzGpBuWzlaFRaiSVV4IvU1Ig3E/uTVdtqTX3sqQZh8+Sf7jQUcxysI2I6rxte
         grP8zFWU8ODOYvaPJ9FF6Ga0xYaJQhrdIPRaQNW+eJGFdVVR/o2hoY/Q+jinjGWxaXfb
         j7/ICc2F/vVkPX3P5QtmyK4dvO3UjP1ZRSSYsATAHDvyaiK/LXNkUL2sxwsJHuG/TL6T
         GRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351875; x=1790956675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBl2dFsWiMsFSqUAN5NQylf+8ZNg8zQAaPdvj+WmO8o=;
        b=TVD4AMLuEpRtGG7J2Ax62Q+f6TDAbKi2ME6gVBeYKI/8hAh91mlc0gLVjk7c2VcTVN
         G+8ocDkBcmgSXROKgKq6fuDcBrDHITV0QRlfrAmHWKCme3cTpgPNI3oD/sx46mBptDcT
         OEPGwfelp+NT8iG8FO/US/5vQoE7Jq8I3n2aJRl8rE8tVyYJ23/rEgMcF2SCS5Ba+BSS
         xEJ3BP8Ay+b3irn0YTg9xkl/0nQHL2jgncQGK0JKrvUeIlXGMtjE9APIFryQ1JoaD5lX
         5VsYwGaS7V1RHkp7Xroh9XMa7mPsrw4q7pB0FNbKqiQOArrgzdFx5s+xH4BCnGrXN+U4
         y0jw==
X-Forwarded-Encrypted: i=1; AKwUvBy9k5xQFI3/J/qK+AGfsOxXco5fQKiaLOTP1GFLCI20IK0z6d0yB/9ijSKBM85rPCnJkHm76xc=@lists.infradead.org
X-Gm-Message-State: AFuF++l94SQZjUVOzHpGKS4mPftJd3B6sDT81tttk6kCNDEYSHy97evE
	+Agi455L0QqmJogqKf1kiw3+1No3//P5NveAdwTmJVhlwojzs1BKMb55T6N3+U6WisG+qpKOT4a
	y///4xVa30aYy/AzduM0LEAFKHybT+wdFe6JSNVUpUPqa5uJILqMuOgrotTm37XeC
X-Gm-Gg: AYBFou3oOztRCZsLsPiUxuduYo7Gt7hRUGGL1TEFBxKQU4fo6M0pTifl5GW0GUIERdm
	naokLP9WO2Derqo5LTB46PZ0NPcFd5daEIeeN6gM/I0dETYnOymp32vevhbv8Eet6MMyNrpTdf3
	kVhrbttVYKXfwFtD1US0/yanC09ZzP/e+I/O/MyQt4pypcnlLo8pH1NTCmPlLdytaCCPtJ3T5rh
	DteGgQRpj+6HQTS/jth62uZvK8kA5NajmLkiqfqzrms1yfzay4TngVhPU6EC8gkeJ5rCJbZfrtG
	d+Q/85zfFCu8LMQsTmARQbSP3yZ7XO7i5HaXkX9RvRCSeY3GT+0XeJ+Ff5PtANWihtFFut9e8gA
	WQ9iVja4UUjk8+mdxmw94uYg0zIY=
X-Received: by 2002:a05:6a00:2d96:b0:880:d0d9:fece with SMTP id d2e1a72fcca58-880d0da1e8fmr852054b3a.36.1790351874767;
        Fri, 25 Sep 2026 08:57:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:880:d0d9:fece with SMTP id d2e1a72fcca58-880d0da1e8fmr852010b3a.36.1790351874126;
        Fri, 25 Sep 2026 08:57:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:57:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:29 +0530
Message-ID: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9rYckSa/HOQZ
 K0mFRWDHR2/p5pB59btEKA4ixcR4IqROR/zrxN+QpZeCWnGeMl6YEpMw77mmY8hNRK5hvq3KK0L
 dlqx5EoNRKf9BAUqW/YLoOmrbYolz5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX1G4b/pIE3NPj
 viObDxFoQcNcZpNygbQLFUXW+sbyQu82h+D0gLTsAICELZyCGHphdMw4ISBsbiYmSK5TMpo1wMC
 bcBTg4Vivxdq33faP0iBywk+KzlriOW+odOF4t/LGMrb03aWzU/4RX7K8oHJJ/K9SDxTUpFvXkh
 /U60bdv58HQx9upqWpSbrF0L1QVVJ/PqJgeIEG6YNcpqwASMZo3V2ikgdRh5jNs37a/7EhI8rAs
 bD9/kiHVgz1VtCIYz7bAkkhwVh+oC2N7vH4mT7sHsNPv6nxRmI0h3ndFXkqt8+4YdZiUd8nseJ0
 sP4sWhhf+TaaDijW9wuoC8JZcrjDCcsEdR4Gfwolqt1C/m/VyS8ZzmziHx6MPtrNHE+7Aohg6ls
 CROtoF582Yy2JUP9IPMaBhPGYyZqi5vmp2Lx3rFagVZlUNSiu+Z3751hmh29c+U6PmejgpOaX2F
 3hldtpfQR8PBdfDu+HA==
X-Proofpoint-GUID: 3iQPFmUCs0wB6Gd0TgcSq20Ywem7Itaz
X-Proofpoint-ORIG-GUID: 3iQPFmUCs0wB6Gd0TgcSq20Ywem7Itaz
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69a03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zG7KPAmT95cOeVn0dqYA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085757_011712_30EEEDB0 
X-CRM114-Status: GOOD (  11.25  )
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

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

This series is based on top of although no dependency as such.
  firmware: qcom: pas: Make MDT buffer retention explicit


Mukesh Ojha (8):
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 16 -----
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 21 +++----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 20 +++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 24 ++++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 31 +++++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 59 ++++++-------------
 include/linux/firmware/qcom/qcom_pas.h        |  1 -
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 96 insertions(+), 149 deletions(-)

-- 
2.55.0


