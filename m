Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8D606EE94
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0kfaqWUX;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8T9pzOk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpLQ6ios
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=; b=0kfaqWUXcw3hR1
	xVyFvRzwu9HhksgcRwrh/Q+1NY2zMKHrkjQrgulcqzEtRj/ZLNZB/oGxJWTh0FqoJRAEbE1d3oOYn
	aLY45u2lAt0iK4x0Ah+AflhNFePsBcG0358ohHGVkbVF00o0My4u1XJOK+Bxf2yMqiCNoRli4j6sS
	pPuriiWnaApgJKs1WTIqmXFy4yWe9ShJ0YW9MZloMb5NIjR+17JnRbRyWdpVmljL7uZo9F50EN0V9
	aT7IHaqK9LnPAXPgqN9mxBVFDfKo+MoU2Vr5d3KBJk6rLw/IqL08Nse01HPACQxWjJ3QmVv8M70U5
	gWRPLaEQ+L7e7TsstCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWm-000000042zm-0pVX;
	Wed, 04 Nov 2026 01:11:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWj-000000042tG-2KvF
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RMlh222165
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=; b=U8T9pzOk6WCaY0Oc
	8pm3jWsohRx2/wzx+Nj47binhY9OZXIuElGlia8zmUy9S5xYF4O914XqHCYNlfCo
	1xpTlUAkWZGWQIA46fHlq9Z7jz1jYuud+A+ckc7RA57yI2QOM+z4KHW6fx58YWo1
	nwD/RhLQH155AXILAxD6HqmbOG5CZVVjBx9gXf+vtuXlT+Wi4J+EEeLMUHe6TPcw
	q8fwEhgWimGggHB+56WHI2D2Yv6Rf/vCG2gyTsEGeOtSEMR7Eb1Y0VAM00GlP/xF
	utcOoTBOZQscLnAPo7vqrnnuLuojReP22idI7jtvzMPYJsEtNqLHlrd7BmuP7sXU
	/9YnPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubj23f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso157185eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754656; x=1794359456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=;
        b=KpLQ6ioshcuj0v2WeymVvbIi+uDGsAOjQOXgZZZ5x7Hn7i9i1bgMBEyoj/BNiZwiPt
         mb2DNMn7niqIEWbiXsvOy7U2AsM1Y1N1zvyiVxP2PFmIy5RXTGS994ChEodVFpgrHOAY
         VME85mBGDzPf0ST4FPAulKhv3ZHPJqiYpMTWiBHS6M9V87f7/8+9nH2UI4sLEpPMcD3y
         2xZjO0PC86nZrym3b+UZDaQFjw2f6nA81hfB3jc1OkZRcKd2gjAn3Xf45k0mhfuahzLI
         MOld5+Dx4zzcEhifxiOakIhoqdjeE6g4hOv3AJfDUEVk90u7u5zxMjnXeXKENVW51IzG
         1qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754656; x=1794359456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=;
        b=JifedyAwqcDhPHjNrYvDB3IYS9eOpFvoDks9VU7gtZgi9VH/nRYZcPiFpZDv+dRAei
         aXzGAfQjI32uIHJFAj9NJkg4ZdpEwY3sS3rdT1RI9aZX+QHetghVokVixYxWn0790n6D
         rPpJlYGbor7jfBfypkUiZ1obOO3MOM33vNlCKtc84geIAtRuAmJi3wk71DanPnyoqo53
         NcEYmSPccaVcvXgATQ1sbL86zGvjQtIiPey8puTPPSpOmkmcrnJ6ttY+97AdrmvMz0EO
         gwPGZjzjcm4DSE/ToIgW+cprH/TVqiRh5Fxv9rpMlpw/m1syC71Lz5a2iAduxYgoe2It
         S5sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWMu8PsSwIr20oMFqcWsdtLeGYUc8Rbcbj4kHlmjOpIaz2R2YjZiSlaeJoWZ244m8q3wTKSxE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/euHIkScK4STsfqPMiUxLOa/U/u8iGtHPTi13zd+lDFn0APoFT
	qQmak/Z1i/XnVYGrLGZCtJL+kqD0tB1O5bAbINJ2tvJOPRureKSw1pZ8MhaI41QKrs3v3cziVpm
	6YcoWth5SwXCHfV8g+KGIVbDeVlkdjYR+39s8MytGHfdXkX9FOB7p23HU6NuusG/o
X-Gm-Gg: AYBFou21Z+9CVODgTa+HvhKsVMo2fApPYFJu/87fC+DIHJuYOCgrKeYwucoN8WBagIz
	Jyc2tqxVcBFcwWa/xLisg/CXukEP/ik/MIXAYJv7m7kGFZ3Mz/tLxEpFn74askoeFshBWOR4Iz6
	jVeWdd6GRlGUXOtRKSP8rWVnWCfrxuzWPAHgQvZ0DlyrLU9uAurNkCU28gy8+rLFLUz8mGdFHyH
	QQVmVZrk6Dxi6r5jXskv88K76InelZPD8io0qO0SyZnc/eh5vOKvio3N/5vx8IJbg0k11s8IMFU
	btAD1CeYZrrgnEATsvvb/lgHgVItP4EO5UJh0/mA9l62zJXyZ0CDrWpweWO9JQQzpMTwZLCLOvy
	74xYkUuOzOcg504epoIyYoCnsZI2dSMBoGvP5vo9FvSG0NSi5k1/qJa/F8gavH2tHqe55QhaSqM
	0DdmeYLkkN6oK5f27+u47+YqzuSqoi3K8ANhPw
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr22051683eec.27.1793754655316;
        Tue, 03 Nov 2026 17:10:55 -0800 (PST)
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr22051635eec.27.1793754654362;
        Tue, 03 Nov 2026 17:10:54 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:51 -0800
Subject: [PATCH ath-next v3 08/13] wifi: ath12k: ng: add batched REO
 command sends
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-8-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX3wFam9OU5qiI
 ZrIa8KYAsoB2p65zE8ka47aUnuNx46m1hWQpvyYvGiy2hN4cpt92Gq0Sp6j80j6OVD8mrJGc8iW
 cW2oC9oAXwByc73oB/CDUxhmhH+grkM=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea8620 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CnFql80LsPCNzfZI1G4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: gTgLuTAxByt77qFIx53pgP8alOKRRuTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX5yValMMY1Prx
 +/lWFORZ2YGbqHFRxSRzTkK/MwT1tx6Pe0SHTllZKZRqtWQ8+6ZU+C4N50dt5rgdwK7o0ULoW9X
 v7REWWlmi6//H3tkESINMCNdg9BoQljHzbVPP2qJsSMkTjRZgvoY1FeciTSYI9m0g+Vu8ssXlvs
 ZWn0z/EjVtbKn3ijU7PCjbzK80pEyq14Pf8VnzQlytkVothX0qDlXOGQgntiXy2t64IJPyjr6A3
 aC8H6MfUWa5AZIvxn11oL6Dghmp+mAGRGLr9hvHSLlUO3OTU/PtplVJqy5fgWNCKUrfDOE5cpzQ
 yr+tTGymDdJli09s+RkJ7sw9v/cuTChfLcrRvnrh2FrZcIvf23N1Om9/fkENakzll/iCLJRmKfd
 D91H63ZDBNNnPsdZCtaEJtxRZU9pUjQ9kYuNv2DH/Rqd1AF0Xh8dn1PkmXe+cl8NevjN/epcrp4
 BvPAiv11Tgcf7vt8xmQ==
X-Proofpoint-ORIG-GUID: gTgLuTAxByt77qFIx53pgP8alOKRRuTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171057_731738_BFD97EC1 
X-CRM114-Status: GOOD (  21.26  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RX TID setup needs to send related REO operations together so hardware
sees a consistent queue state and the driver can keep one pending-command
view for the whole operation.

Add Wi-Fi 8 helpers to submit multiple REO commands to one command ring
while reusing the existing pending-command callback tracking. Share the
HAL descriptor formatter between the batch and single-command paths.

Reject batched flush-cache commands that request delayed blocking
because those commands mutate the shared REO block-resource state. If
descriptor formatting fails after reserving entries, restore the source
ring pointers before exposing stale descriptors to hardware; keep the
same rollback behavior for the single-command path.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h          |   6 +
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c  | 184 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h  |  12 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c | 138 +++++++++++++++----
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h |   9 ++
 5 files changed, 297 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 6534e11a3378..b4da48af5a4b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1141,6 +1141,12 @@ struct ath12k_hal_reo_cmd {
 	u8 pn_127_48_info;
 };
 
+struct ath12k_reo_cmd_entry {
+	enum hal_reo_cmd_type type;
+	struct ath12k_hal_reo_cmd cmd;
+	int cmd_num;
+};
+
 enum hal_pn_type {
 	HAL_PN_TYPE_NONE,
 	HAL_PN_TYPE_WPA,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index 632ce30fe459..14117430c43b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -50,6 +50,73 @@ ath12k_wifi8_get_sw_desc(struct ath12k_dp *dp, const struct hal_reo_dest_ring *d
 	return ath12k_dp_get_rx_desc(dp, cookie);
 }
 
+static inline bool ath12k_wifi8_dp_reo_cmd_shutdown(struct ath12k_base *ab)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+
+	return test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
+	       test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags);
+}
+
+static int ath12k_wifi8_dp_reo_cmd_prepare(struct ath12k_dp_rx_reo_cmd **dp_cmd,
+					   void *data, size_t len,
+					   void (*cb)(struct ath12k_dp *dp,
+						      void *ctx,
+						      struct hal_reo_status *status))
+{
+	if (!cb) {
+		*dp_cmd = NULL;
+		return 0;
+	}
+
+	if (WARN_ON(len > sizeof((*dp_cmd)->u)))
+		return -EINVAL;
+
+	if (WARN_ON(len && !data))
+		return -EINVAL;
+
+	*dp_cmd = kzalloc_obj(struct ath12k_dp_rx_reo_cmd, GFP_ATOMIC);
+	if (!*dp_cmd)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&(*dp_cmd)->list);
+	if (len)
+		memcpy(&(*dp_cmd)->u, data, len);
+	(*dp_cmd)->handler = cb;
+
+	return 0;
+}
+
+static void ath12k_wifi8_dp_reo_cmd_queue_locked(struct ath12k_dp *dp,
+						 struct ath12k_dp_rx_reo_cmd *dp_cmd,
+						 int cmd_num)
+{
+	if (!dp_cmd)
+		return;
+
+	lockdep_assert_held(&dp->reo_cmd_lock);
+
+	dp_cmd->cmd_num = cmd_num;
+	list_add_tail(&dp_cmd->list, &dp->reo_cmd_list);
+}
+
+static int ath12k_wifi8_dp_reo_cmd_validate_batch(struct ath12k_reo_cmd_entry *cmds,
+						  int n)
+{
+	int i;
+
+	for (i = 0; i < n; i++) {
+		if (!(cmds[i].cmd.flag & HAL_REO_CMD_FLG_FLUSH_BLOCK_LATER))
+			continue;
+
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 					     struct hal_srng *cmd_ring,
 					     void *data, size_t len,
@@ -63,25 +130,14 @@ static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 	int cmd_num;
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct ath12k_base *central_ab = central_dp->ab;
+	int ret;
 
-	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
-	    test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags))
+	if (ath12k_wifi8_dp_reo_cmd_shutdown(ab))
 		return -ESHUTDOWN;
 
-	if (!cb) {
-		dp_cmd = NULL;
-	} else {
-		if (WARN_ON(len > sizeof(dp_cmd->u)))
-			return -EINVAL;
-
-		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
-		if (!dp_cmd)
-			return -ENOMEM;
-
-		INIT_LIST_HEAD(&dp_cmd->list);
-		memcpy(&dp_cmd->u, data, len);
-		dp_cmd->handler = cb;
-	}
+	ret = ath12k_wifi8_dp_reo_cmd_prepare(&dp_cmd, data, len, cb);
+	if (ret)
+		return ret;
 
 	cmd_num = ath12k_wifi8_hal_reo_cmd_send(central_ab, cmd_ring, type, cmd);
 	if (cmd_num < 0) {
@@ -97,15 +153,82 @@ static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 	if (!dp_cmd)
 		return 0;
 
-	dp_cmd->cmd_num = cmd_num;
-
 	spin_lock_bh(&central_dp->reo_cmd_lock);
-	list_add_tail(&dp_cmd->list, &central_dp->reo_cmd_list);
+	ath12k_wifi8_dp_reo_cmd_queue_locked(central_dp, dp_cmd, cmd_num);
 	spin_unlock_bh(&central_dp->reo_cmd_lock);
 
 	return 0;
 }
 
+static int
+ath12k_wifi8_dp_reo_cmd_send_ring_n(struct ath12k_base *ab,
+				    struct hal_srng *cmd_ring,
+				    struct ath12k_reo_cmd_entry *entries,
+				    struct ath12k_reo_dp_cmd_desc *dp_descs,
+				    int n)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_dp_rx_reo_cmd **dp_cmds;
+	int i, ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries || !dp_descs))
+		return -EINVAL;
+
+	if (ath12k_wifi8_dp_reo_cmd_shutdown(ab))
+		return -ESHUTDOWN;
+
+	ret = ath12k_wifi8_dp_reo_cmd_validate_batch(entries, n);
+	if (ret)
+		return ret;
+
+	dp_cmds = kcalloc(n, sizeof(*dp_cmds), GFP_ATOMIC);
+	if (!dp_cmds)
+		return -ENOMEM;
+
+	for (i = 0; i < n; i++) {
+		ret = ath12k_wifi8_dp_reo_cmd_prepare(&dp_cmds[i],
+						      dp_descs[i].data,
+						      dp_descs[i].len,
+						      dp_descs[i].cb);
+		if (ret)
+			goto err_free;
+	}
+
+	spin_lock_bh(&cmd_ring->lock);
+	ath12k_hal_srng_access_begin(central_ab, cmd_ring);
+
+	ret = ath12k_wifi8_hal_reo_cmd_send_n_locked(central_ab, cmd_ring,
+						     entries, n);
+	if (!ret) {
+		spin_lock_bh(&central_dp->reo_cmd_lock);
+		for (i = 0; i < n; i++)
+			ath12k_wifi8_dp_reo_cmd_queue_locked(central_dp, dp_cmds[i],
+							     entries[i].cmd_num);
+		spin_unlock_bh(&central_dp->reo_cmd_lock);
+	}
+
+	ath12k_hal_srng_access_end(central_ab, cmd_ring);
+	spin_unlock_bh(&cmd_ring->lock);
+
+	if (ret)
+		goto err_free;
+
+	kfree(dp_cmds);
+	return 0;
+
+err_free:
+	for (i = 0; i < n; i++)
+		kfree(dp_cmds[i]);
+	kfree(dp_cmds);
+
+	return ret;
+}
+
 int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
 				 void *data, size_t len,
 				 enum hal_reo_cmd_type type,
@@ -116,8 +239,9 @@ int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct hal_srng *cmd_ring;
+	u32 ring_id = central_dp->reo_cmd_ring.ring_id;
 
-	cmd_ring = &central_dp->ab->hal.srng_list[central_dp->reo_cmd_ring.ring_id];
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
 
 	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
 						 type, cmd, cb);
@@ -134,15 +258,31 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
 	struct hal_srng *cmd_ring;
-	u32 ring_id;
+	u32 ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
 
-	ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
 	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
 
 	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
 						 type, cmd, cb);
 }
 
+int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
+					    struct ath12k_reo_cmd_entry *entries,
+					    struct ath12k_reo_dp_cmd_desc *dp_descs,
+					    int n)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
+	struct hal_srng *cmd_ring;
+	u32 ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
+
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring_n(ab, cmd_ring, entries,
+						   dp_descs, n);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 10940dd92a62..2fb56776adb0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -12,6 +12,7 @@
 
 struct ath12k_dp_hw_group_wifi8;
 struct hal_reo_status;
+struct ath12k_reo_cmd_entry;
 
 struct hal_rx_mpdu_desc_info {
 	union {
@@ -159,6 +160,17 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
 					  struct ath12k_hal_reo_cmd *cmd,
 					  void (*cb)(struct ath12k_dp *dp, void *ctx,
 						     struct hal_reo_status *status));
+struct ath12k_reo_dp_cmd_desc {
+	void *data;
+	size_t len;
+	void (*cb)(struct ath12k_dp *dp, void *ctx,
+		   struct hal_reo_status *status);
+};
+
+int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
+					    struct ath12k_reo_cmd_entry *entries,
+					    struct ath12k_reo_dp_cmd_desc *dp_descs,
+					    int n);
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index d78c178cc70d..12a37c395bb0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -536,24 +536,116 @@ static int ath12k_hal_reo_cmd_unblock_cache(struct hal_tlv_64_hdr *tlv,
 	return le16_to_cpu(desc->cmd.reo_cmd_number);
 }
 
-int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
-				  enum hal_reo_cmd_type type,
-				  struct ath12k_hal_reo_cmd *cmd)
+static int ath12k_wifi8_hal_reo_cmd_fill(struct ath12k_base *ab,
+					 struct hal_tlv_64_hdr *reo_desc,
+					 enum hal_reo_cmd_type type,
+					 struct ath12k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_64_hdr *reo_desc;
-	u32 saved_hp, saved_reap_hp;
-	int ret;
-
-	if (type == HAL_REO_CMD_FLUSH_TIMEOUT_LIST) {
+	switch (type) {
+	case HAL_REO_CMD_GET_QUEUE_STATS:
+		return ath12k_wifi8_hal_reo_cmd_queue_stats(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_CACHE:
+		return ath12k_wifi8_hal_reo_cmd_flush_cache(&ab->hal, reo_desc,
+							    cmd);
+	case HAL_REO_CMD_UPDATE_RX_QUEUE:
+		return ath12k_wifi8_hal_reo_cmd_update_rx_queue(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_QUEUE:
+		return ath12k_hal_reo_cmd_flush_queue(reo_desc, cmd);
+	case HAL_REO_CMD_UNBLOCK_CACHE:
+		return ath12k_hal_reo_cmd_unblock_cache(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_TIMEOUT_LIST:
 		ath12k_warn(ab, "Unsupported reo command %d\n", type);
 		return -EOPNOTSUPP;
+	default:
+		ath12k_warn(ab, "Unknown reo command %d\n", type);
+		return -EINVAL;
 	}
+}
 
-	if (type > HAL_REO_CMD_UPDATE_RX_QUEUE) {
-		ath12k_warn(ab, "Unknown reo command %d\n", type);
+int ath12k_wifi8_hal_reo_cmd_send_n_locked(struct ath12k_base *ab,
+					   struct hal_srng *srng,
+					   struct ath12k_reo_cmd_entry *entries,
+					   int n)
+{
+	struct hal_tlv_64_hdr *reo_desc;
+	u32 saved_hp, saved_reap_hp;
+	int i, ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries))
 		return -EINVAL;
+
+	lockdep_assert_held(&srng->lock);
+
+	saved_hp = srng->u.src_ring.hp;
+	saved_reap_hp = srng->u.src_ring.reap_hp;
+
+	for (i = 0; i < n; i++) {
+		reo_desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
+		if (!reo_desc) {
+			ret = -ENOBUFS;
+			goto err_restore_hp;
+		}
+
+		ret = ath12k_wifi8_hal_reo_cmd_fill(ab, reo_desc,
+						    entries[i].type,
+						    &entries[i].cmd);
+		if (ret <= 0) {
+			if (!ret)
+				ret = -EINVAL;
+			goto err_restore_hp;
+		}
+
+		entries[i].cmd_num = ret;
 	}
 
+	return 0;
+
+err_restore_hp:
+	/* Keep batched command submission all-or-nothing. If any descriptor
+	 * cannot be reserved or formatted, roll the source ring pointers back
+	 * so partially prepared entries are not exposed to hardware.
+	 */
+	srng->u.src_ring.hp = saved_hp;
+	srng->u.src_ring.reap_hp = saved_reap_hp;
+
+	return ret;
+}
+
+int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
+				    struct hal_srng *srng,
+				    struct ath12k_reo_cmd_entry *entries,
+				    int n)
+{
+	int ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries))
+		return -EINVAL;
+
+	spin_lock_bh(&srng->lock);
+	ath12k_hal_srng_access_begin(ab, srng);
+
+	ret = ath12k_wifi8_hal_reo_cmd_send_n_locked(ab, srng, entries, n);
+
+	ath12k_hal_srng_access_end(ab, srng);
+	spin_unlock_bh(&srng->lock);
+
+	return ret;
+}
+
+int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
+				  enum hal_reo_cmd_type type,
+				  struct ath12k_hal_reo_cmd *cmd)
+{
+	struct hal_tlv_64_hdr *reo_desc;
+	u32 saved_hp, saved_reap_hp;
+	int ret;
+
 	spin_lock_bh(&srng->lock);
 
 	ath12k_hal_srng_access_begin(ab, srng);
@@ -566,26 +658,12 @@ int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 		goto out;
 	}
 
-	switch (type) {
-	case HAL_REO_CMD_GET_QUEUE_STATS:
-		ret = ath12k_wifi8_hal_reo_cmd_queue_stats(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_FLUSH_CACHE:
-		ret = ath12k_wifi8_hal_reo_cmd_flush_cache(&ab->hal, reo_desc,
-							   cmd);
-		break;
-	case HAL_REO_CMD_UPDATE_RX_QUEUE:
-		ret = ath12k_wifi8_hal_reo_cmd_update_rx_queue(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_FLUSH_QUEUE:
-		ret = ath12k_hal_reo_cmd_flush_queue(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_UNBLOCK_CACHE:
-		ret = ath12k_hal_reo_cmd_unblock_cache(reo_desc, cmd);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+	ret = ath12k_wifi8_hal_reo_cmd_fill(ab, reo_desc, type, cmd);
+	if (ret <= 0) {
+		if (!ret)
+			ret = -EINVAL;
+		srng->u.src_ring.hp = saved_hp;
+		srng->u.src_ring.reap_hp = saved_reap_hp;
 	}
 
 out:
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index 357839c7d9e3..430b0f07563f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -100,6 +100,7 @@ struct ath12k_hal_rx_cmd_ring_param {
 
 struct hal_tlv_64_hdr;
 struct hal_reo_status;
+struct ath12k_reo_cmd_entry;
 
 int
 ath12k_wifi8_hal_invalidate_rx_cache_cmd_send(struct ath12k_base *ab,
@@ -108,6 +109,14 @@ ath12k_wifi8_hal_invalidate_rx_cache_cmd_send(struct ath12k_base *ab,
 int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 				  enum hal_reo_cmd_type type,
 				  struct ath12k_hal_reo_cmd *cmd);
+int ath12k_wifi8_hal_reo_cmd_send_n_locked(struct ath12k_base *ab,
+					   struct hal_srng *srng,
+					   struct ath12k_reo_cmd_entry *entries,
+					   int n);
+int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
+				    struct hal_srng *srng,
+				    struct ath12k_reo_cmd_entry *entries,
+				    int n);
 void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,

-- 
2.43.0


