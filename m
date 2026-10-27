Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A2606A33B
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f19n7kMW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J8u6qZc8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n101vkG0N/G/63SBZEld8AZPiXf6J3zncGJX/JaoIzM=; b=f19n7kMWpaKWmN3iaTovVjnLdM
	ls1RAd2dYtS2lXopMdg1DBTfWFXAiZs9Qw850rSqp5AVCJpb5HXyogzraG6nNzNHc4DJaGD6wEfw9
	REVPV24+x7r0G3tJeXeD/0RVfZyHR7nww6pS2PeH/CzBmTFCfl4+jXGEk1VscWkbbc41FMEctnB37
	WHN/Ek8LmsCypTCrE+/kDkTHFrLHz27ycfm51w4lsRyKNP6wU3zg82yaXs+5+AccropU9vqeEFr//
	Ow8zyfypfTZRRUSBKBl7E16Y6X/XA1bINA6TwtsYFjXKpuv2L7NNMU+J6Ox5+G1SyT5qc8N7C7nV2
	92O3IWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLft3-00000004YZ6-44gi;
	Tue, 27 Oct 2026 12:02:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLft2-00000004YYr-3S01
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 12:02:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4364760052;
	Tue, 27 Oct 2026 12:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660421F01240;
	Tue, 27 Oct 2026 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102560;
	bh=n101vkG0N/G/63SBZEld8AZPiXf6J3zncGJX/JaoIzM=;
	h=From:Date:Subject:To:Cc;
	b=J8u6qZc8g069GwgzmnAC3uMDNUnqXvnD9BP7WZKkQIqY99YlrTnV01nehNpCETVoC
	 TXICza2KEl9OXJL7Xu4T7bPReJCUvKGJoWnHllnvrkX2THMnKomoUu5Z1AtXEmdXqI
	 /ntFNLbBuBrzYmctN/c9KEduzA6p8meF8/ME3jsheazi+LrnXiBlC7iJ7zrQkgyxIw
	 orwlNFczG8oigxjVST8Zh8go1StEdu3i+8Svx+hdTSWqXaAqSB2n3FjqoL3SwVd1gP
	 Bv1EqQQHUYa1aoIULQ98SXUrWpbOJwkHGkC4/4TgEy0mCispiGHoT0ZglJMd9bgGyO
	 xt8LDqqDtROJQ==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 27 Oct 2026 17:32:20 +0530
Subject: [PATCH v10] media: qcom: Pass proper PAS ID to set_remote_state
 API
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMuS4GoC/x2MQQqAIBAAvyJ7TliFFPpKdBBbaw+ZKEQg/r2l4
 wzMdGhUmRosqkOlhxvfWcDgpCCeIR+keRcBFq0zaL0uoYnSF+0ctI/RY4qzNy6BJKVS4vf/rds
 YH15rRMNfAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, bod@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-media@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run, 
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com, 
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, mchehab@kernel.org, 
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
 kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org, 
 mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com, 
 mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com, 
 jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com, 
 vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com, 
 amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org, 
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com, 
 skare@qti.qualcomm.com, linux-kernel@vger.kernel.org, 
 gourav.kumar@oss.qualcomm.com, Eric Dumazet <edumazet@kernel.org>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.13.0
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

As per testing the SCM backend just ignores it while OP-TEE makes
use of it to for proper book keeping purpose.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
Changes in v10:
- Resent standalone, as all the earlier patches of the series are merged.
- Link to v9: https://lore.kernel.org/all/20260702115835.167602-11-sumit.garg@kernel.org/
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
 drivers/media/platform/qcom/venus/firmware.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..ed2bd0e83797 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -262,5 +262,5 @@ int iris_fw_unload(struct iris_core *core)
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_pas_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
 }
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..3c0727ea137d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	int ret;
 
 	if (core->use_tz) {
-		ret = qcom_pas_set_remote_state(resume, 0);
+		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
 		if (resume && ret == -EINVAL)
 			ret = 0;
 		return ret;

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-pas-id-media-7cc70fc5716f

Best regards,
-- 
Sumit Garg <sumit.garg@oss.qualcomm.com>


