Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A5C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=; b=ABrHxbdn96QpFQQDoSTZSFfmAU
	oRB6VmrJzO5vwqYiGM2vN3uTajjDra5UQY+gBHthpET15nmdrngsURGHgQFEQqOu30iuXsVpuW5U3
	MAf1azoS8n9G/eEYAJPMdPuX5+Jgc0fXu2AbbS3cVnIMhTgIYmKibKY2OWV5PSr3+I/mnK+2r1r3z
	3I15cOSpQmXUvXSukkZT6b8UOQPgq/fJIHogyZMSN4R08lbkkQnqy1iAJQJatt9BVyQT9tbTDOC4w
	jIHsh+8j40FQoA+y1fIk30YgIQnQl1ZY25HS40AnPrOXunk+xHfyI8VHdQ0nFAQy/G53ikShguP9u
	FS8vngqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8KC-0000000DskG-1PNg;
	Fri, 25 Sep 2026 15:59:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8K9-0000000Dsj3-36kV
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=; b=DtSBEZ1uWLdd3G0T2NxCtii/5e
	An02pUSWVE98AtgLR+WpWExNlACE3Dp1pvROhZpGFrIFwHYNdsP/R8Sqb7RD7X/hvV1Bwnzaje6Mm
	CGwlt4Fmy52gfOyvD7XvBL8ZNNkuRNx4UYfZNRDEO/HUbTccHbphCw5aCxa/3L5NlzvskeTI1YLLJ
	nSnMupGEQP+MUV6pGFOyqJ83c1zzqIXEY24AyUYlNyftaX/a5NfFfj3XAoZnolegIh3RH7+sEQTV2
	K28L4TCsAMsz4iOhXYdBGcXghMxghdXDob2kobydh1jn4fCKefomDH/mmeczLNrN4LAOzasj8vC6n
	gzhR6Dtg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8K6-0000000H6HR-18e9
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:58:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDQuTe600599
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Re9X7fDOvky
	ZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=; b=oC07C3/hiKVobgyyQIg7t959R6f
	YHcd6DGucgx6/9UpFntG6CVahsQTYbX9NStEygY0rqWNqzM9lktgwqw6h7BiZ5WQ
	4E23Qs7gfOsO/Blg36FLPBkfrqHgb0O7qKomekwLlF23B+f/HBi/lF4wBzIKRKd3
	zkRdSw+dIv0NIChmVGxtD8pShQR4kpxErNLGo/Yzu3JQjCIivC+kORcWIuUlKeZj
	Zg7jSRwWX79atchpE8gm896O7EmQMftWdmNGVG2xRGo7OQQ9rG7xY86AE0fO1oKW
	JaoK4iObBAaPykeRkFwndawxq6BxjfqRfn/ZQRDWFzAdwgyl4WhFm65/j1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8710450f731so775932b3a.0
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351932; x=1790956732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=CHcz5ciH5DOLcFBVJv7kj1+Wu/hJfpajyUS/JFZSBkSQg9UGhdnzOcob/3CvgF5037
         3aJiQeKAwrGsCbhMGa0s3nPl9OA7/YqdmYtCukccFDVEhRWVcOlE5o+/EB4iMvcFAQqq
         5voXVxp/y/kxlIUJ7naxEfxQdTqiCvY5So0fmmfADAjJBw7WEvKZicEFRY5CYLk6pyUX
         R/oDJmI6DWQE0fndi55bnPW3Rd1H+VAkrb4ivy0JSVuJ3BPypCq8IX16NCLtaVyHlHGR
         PC085IePyYSPNUzThI3jvAUEJBDfwR8vyN4SJYFuIT/cB1rwvdq+5qEGf/J5zkpKny4P
         n6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351932; x=1790956732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=Q8RvYi8ZFaDoqrmA/XSNDSSMQvFVYTHmY7yPwzlPT2lVF/Sy/Luu78L/8qLRve3Ok6
         76mGnCzU4mJp0+mzcTfhJxlRuB8tz7uL2Ro1UeLP2m0qqebpDzRpt6mqtcNRlVAeDDDQ
         JT+9A1eC/OIJdZ2n1Hq3fUTIrlpuiWcW4il0YR0Nu5z06L7QiEI3NJKSdStUzogtjgWf
         jwtxzmdVurNUMrxKMW7onkWY7jYCQCYLENOGCmRQVDhscIp8AGaO7uP1uCTodoDy+7f7
         mMY2W06GhYYzlqpKHvJGK2qZSYgTy5rSFPuMi33wWBFwSEjvTdzFjpyqhJZJafClY/qo
         ojxA==
X-Forwarded-Encrypted: i=1; AKwUvByLdjlmJ42GkTW7SUQ/JtDLjJlAkc3czuzPCFlfzU69V9bR9ZfCWnu6W3olg2voVFZvbtVfqQ8=@lists.infradead.org
X-Gm-Message-State: AFuF++mn+7c6OywpUM0qQqFkOUQ3eRrXqaAyEc8csCvXcaHVaHSQUmRj
	ZSxJIFBZebb13hoaZADvYHLZ7zntbnNVK9C++nSz7YeeE+J6e2NvV5zl2uGzWm/i32qYxwd8slF
	5Y9+jJnqmpAwyOS/Dwv/UhOv3yJSVr823HJiSTo6ZnTpLWcjyXaCt7Au1YuQ+67gu
X-Gm-Gg: AYBFou3Y2UA2kNufy2+YL7TwOk0T+/3Xpj1Awwi2EojPI2NId51TCihVkRLlfyZFvzt
	asSL2wA285hP3+nXfU0vzMrWf7KdPv6NygFZQ+5w9F6w6if/lIhv3utxwmnyn8XXwDTMvQWFeam
	dOxkv9ynbSuF/3vYqCidhZaixob63MDV0BPrRAxPajQRlEAWgIb5jZGPuNVBGoQUB9S+8xp+OIS
	04W/jPucr8lJPYtc+gnuuoIvnbxo1iADc2RoG7gUOt80Nrx5JENqO4iq/VNpzxBrZX7SXwIVUz5
	4nRctfXQj5k91EKkUYLUjg8LGSoEvbEFGUnY4DayRU6MPLb7B4jl6cWlCN/dzGOONxLcyvvQYyb
	vVBKgTvOJRuiSD6C+ZCLhQR7eAFk=
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033722b3a.31.1790351931534;
        Fri, 25 Sep 2026 08:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033680b3a.31.1790351930939;
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
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
Subject: [PATCH 5/8] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:34 +0530
Message-ID: <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2OgmcuMlqvxBZmtFrbjBKG-pKNl6rKOf
X-Proofpoint-ORIG-GUID: 2OgmcuMlqvxBZmtFrbjBKG-pKNl6rKOf
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69a3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P8P2WCEqvqb6tQ3B-mUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2+Euf3P/DLQk
 V1naTOKqywWBInIsKeGfR6mwxN+Zq0CsBIN0XFhplx1FIkrFUeds4sKpPL1zfZ21Yfk8h/5Tqdq
 pUPUhfRZKQhhaHZ7CwD5BddoZ/5AXG4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX5ZAfLtK/KjMa
 tD0nhaS9N8Q1myOLKNBjGlhLn2mLO0FHgs5np190gy3TB5UFmEwlYf0+D+5X4klC5/q9eoninkY
 7LpVyU7a7N58M0HL2hC2sOM6Vsjn+zi/GxQLOPiY16eQmscsDOBrNJM+V3YvTqUkV80Ggrh2PQe
 XM/CQh/4d3uuNNhWYBF0uqCWhVodlsJGhc+NdsZ7y1VpuBqRF3D1SP16MvynirBKIUaOIZzkidR
 herhMWzh5HCa+sCtgFJt9eR1E/mdIz80CKv0k6BydaMk0XAe+b/vTvaJGEO82/XhKgIb+6GRR4p
 +xPAowFTYMvm76dn9yGdJW+8q1GtNBdtjoNlAu/XZYFwH1SioxYcXC3ypWNKEHYhGrTsUxzqvC0
 sg6NvjInsVxoSoZgjrQYl0o53TUa11KypT3eUFRE8d+Nxto6EuZljAhowFWBWRld/k1kxZIZxIT
 GwUoeE/4OY/UuWOqAhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165854_592073_6C474ED0 
X-CRM114-Status: GOOD (  15.09  )
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

ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
memory setup, and segment loading with no PAS context, then calls
qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
before TrustZone authentication.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
the same context to qcom_pas_prepare_and_auth_reset().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..6964395caedd 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context *ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
+	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
+					  resource_size(&res));
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		goto out_release_firmware;
 	}
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0


