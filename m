Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D2AEB106D
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QRtgjL6YhmblrErajJMNeEeuRhcl0G8eAa6X9zELIE=; b=qGlnc9Y1aVfsjrYd2lTpJC73hs
	m/1yGWmYShwq9y2+fjHuoFIR8Lvp7nwuCad8gaz++V9QO2+dJonXbf158mYia2BRPTu3YsoUZI8mM
	uhX026LLKNwxZURPJenw7lbOjifGs/bpErotuivduNzasHYfsvqB5FUwZrknhVabwIrvLvgxds1O8
	GFH9oMCuC8pIYQRYQ2TDRf0cIU7YbI2VhiGRG7FBWx2cXZYyCMJhJvqqI2wIekRfE/XuI+BLilxhL
	RfY7OEKWn42CHcbAempESv5RHptffrjd4aHFMaof7WtuYd3q7HO6x56o+CirWYmqZpFg9lVgxoJap
	Ylfu6w6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyon-00000009m6D-0tU4;
	Tue, 10 Mar 2026 15:16:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyok-00000009m5L-3TC3
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 15:16:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AEF6Ua1863547
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QRtgjL6YhmblrErajJMNeEeuRhcl0G8eAa6X9zELIE=; b=oYalrSCp9EC2AEJL
	BYOrejBHy1pEcinZHGReifgf4OrwtOeh6YP63vKbwTWK/rAdd7jaOI/3jTOZVIZg
	mh+dxABpo3pLa1SJ1g3yDSk33eaDg0wBP/19i9IitRANzT47YWhdEs6FgYL0UOAa
	q0Ndwe8g7AWE/Qv92kpSeHp6ZrMTZJUWGYe1X9J5RuwZSElNMvL4gauZxoS3fO7W
	GMSiv2IJxAWIjhQDU5ubYRFh6RvaWTzkawKC/zxre8lS7Q9mUM7OzvwOU4A2aIlj
	BV93BL/pI7/3DPUc+PdUXlbXm96UH5FD00RTwk6MT9RV/Xtqpk7pmW7scILjG03Y
	kb+Zdg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw808gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:18 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40a4d2264abso62798627fac.2
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155777; x=1773760577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QRtgjL6YhmblrErajJMNeEeuRhcl0G8eAa6X9zELIE=;
        b=Sw0szDZb3jbBmpANyZpr/Mli96lzaP1HqdtQXE4qu6Zqjlfdp6+b+pXk2MyIWEO07B
         QsliX618BlxK8NYKvyg5oHo4QWxkDLuFeM7VV+vzwIGRIjAGhnapu1DTAozMy/5aMYKA
         frFenLTuIw8rrbnR/EFx651O9fwIWb2W1AgNCfX7KWhknxju2LDMfNqmnbsLzJ7drjye
         mbxw0egW4L0wXVBdMeeMHIRIVyW1PIddy6T4C3S75ed7J/02s52hKUi+jDEknv2acTz4
         Y6EyGYRNGRYhn8+THBHxsv9KzXkrpUqfBuHrdGkPhsDEg6xkRwWASiml1tXgVGXC/T9o
         FuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155777; x=1773760577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QRtgjL6YhmblrErajJMNeEeuRhcl0G8eAa6X9zELIE=;
        b=OU6QjUNhGU+6OtL6c8FzoWNNErWmvMe8qFxF4HwfWecOeLk2ezp8lcUL40tdrEvzyN
         6dO3R2xxjXBGhF8H2QpWOcpvnalJxVCmiF2R74/rVgti814aGm0t/eBsWlxn26UR83n3
         2CldV8B1X3GXhdwAXK5/89CIYcK7xQ+FVjBQneRuPyX6Y7uudgFiFaw9Qjdc/Kd8oX8v
         vdvfVqX4QScqIwP5mzgTG5kkICBs4oT3LM7c7H4FhvVhoIfzwy7WcKJRyL5cGd8XI0wh
         oQ+7JRWoikWYIEWCzR21dmjXlDVMSf7gvwA4NW9dz/97zem5KY47DA7IWSvy6a/n1mfo
         XQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrnGHOtgOuBgxJo73fFot/VAAQb8sLJrhfXEb1vrompxlS4SWGBvNSiQ+ZtS0cmQWqKRbWlEQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxskTe70TDQcdkv7UEWRNNYKXTj+A5QTX8dlas9IV9F/ipFxmrN
	2gBBwKUJuIQcsAviCWCuVtYP+EuCI/PCF78drrG9mDXJ38ggmB6TWSgw+ZDGAJ4JMkhJbTKFJf+
	XawVaxVzdVY2LlsnctLjlBYo+yjwFqOxpvIlMvOVROpzJryj3WFHSu6MZjZsHVkNZfO9VbPSz
X-Gm-Gg: ATEYQzzobTWk2SJ+mTvXOoY1BC9kBt0QIR3LwlL4D+fuEP9/trpVLN0Y2YI00ol9Kwa
	aY+/tloojlxDQCakZyMpJij2cv6wekakJs1SDXd5tNfN55x5xYZVjr88PT4bu8HWPwPWVTqphlZ
	yKDUsDPDoZlB95s+hZQEBoNPK8tlzVv4yya434PRygOqKk26rpsw/2Xp22+KBJf9tDA3dxekvFJ
	sHzdq3zlcreM60GkrxLiuAzxqGTRjr2tHVssbdp9bKGCXx8qLpsZ7KVodbh/cJBVyC+JBbu9gmS
	QvEtFoLona9kvF+LCSNweHpKgw6jMWOxmtRvnc5u3KoOpewVxkNifRkweq3hqMc1SFTyL1qQYqh
	QnM4C7VSrWdhZEBspqHb31SI8UjPSvZEVQs8TD+c7ail3Q44BRB8ZfJFkc5tpTRVOEAZVkVFHvi
	v8
X-Received: by 2002:a05:6870:34f:b0:3ec:5267:cb6e with SMTP id 586e51a60fabf-416e3ff5d5bmr8759322fac.23.1773155777256;
        Tue, 10 Mar 2026 08:16:17 -0700 (PDT)
X-Received: by 2002:a05:6870:34f:b0:3ec:5267:cb6e with SMTP id 586e51a60fabf-416e3ff5d5bmr8759310fac.23.1773155776796;
        Tue, 10 Mar 2026 08:16:16 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756dbc7afsm2714603fac.14.2026.03.10.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:16:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 08:16:12 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: Clean up the WMI Unit Test
 command interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-ath12k-unit-test-cleanup-v1-1-03e3df56f903@oss.qualcomm.com>
References: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
In-Reply-To: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Kh7HFgri6qpy9wKrGK3w5V4CfqarbJ_w
X-Proofpoint-GUID: Kh7HFgri6qpy9wKrGK3w5V4CfqarbJ_w
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b035c2 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zm9tmq2CayTrKmE_1UcA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMiBTYWx0ZWRfX3M60yrYVIWdu
 kP8r3zVM2xlsW+Q+iGoo6EIghUsOWINBogemOWiOkcVvYYCMR4A77JNkoWzoyufn2/JOIroKLrp
 ADDdtMJpshpB52BPRhpGWtrlTN5V9WrytfyNAuaUUrZOuzmmNw0K8SH8fdWr+GAAaUIuz4Es33D
 8aq5orVWIJ4viYWPkX+4UxoSHGs+ZtLpoehxg6ikbd6ix7yaxjmo2NRiwOoZ5M35R92p2HAltDp
 jEEO3DQYylSBHC3EX/pqwUm9hgULY457dVl5NBasO4w5eVhFw0SV5fxDbeUUy3pDAyYk529lCGP
 ixkwapnN+32xWA7TB58QmX4DYyX66cupcE7ztKBsqJENYZw1GJnHMC/6NxcqYBg++eUiZ0EYOw9
 mm6pJBQ037ZYO08Od5yMs7LtMhMAWlSdOEK2xB+jLxaSC9h7qfq9yF4Tb3ChERWSvlGmS6PpeoM
 VTUIpFV3c4CkLaPMjww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_081618_877270_70B3ECC6 
X-CRM114-Status: GOOD (  20.67  )
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

Currently, ath12k_wmi_send_unit_test_cmd() provides the interface to
send a Unit Test command to firmware.  The payload for the command is
passed in two separate parameters, struct wmi_unit_test_cmd ut_cmd and
u32 *test_args.  This interface is strange in that it passes the
ut_cmd structure by value instead of by reference. But even worse,
this presents an interface that is not endian clean since the ut_cmd
structure is defined in little endian format while the test_args array
is defined to be in cpu endian format. Furthermore, the implementation
of this function passes the test_args directly to the firmware, without
performing cpu_to_le32() conversion, and hence this functionality will
not work correctly on big endian platforms.

In order to fix these issues, introduce a new wmi_unit_test_arg
structure which defines all of the parameters needed by the Unit Test
command in a single structure using cpu endian. Update
ath12k_wmi_send_unit_test_cmd() to take a pointer to this structure
and perform all cpu_to_le32() conversions needed while forming the
firmware command. Update the only existing Unit Test function,
ath12k_wmi_simulate_radar(), to properly fill and pass this new
structure to ath12k_wmi_send_unit_test_cmd().

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 58 ++++++++++++++++-------------------
 drivers/net/wireless/ath/ath12k/wmi.h | 11 +++++++
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b93e33edf369..65a05a9520ff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -10017,50 +10017,46 @@ static int ath12k_connect_pdev_htc_service(struct ath12k_base *ab,
 
 static int
 ath12k_wmi_send_unit_test_cmd(struct ath12k *ar,
-			      struct wmi_unit_test_cmd ut_cmd,
-			      u32 *test_args)
+			      const struct wmi_unit_test_arg *ut)
 {
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct wmi_unit_test_cmd *cmd;
+	int buf_len, arg_len;
 	struct sk_buff *skb;
 	struct wmi_tlv *tlv;
+	__le32 *ut_cmd_args;
 	void *ptr;
-	u32 *ut_cmd_args;
-	int buf_len, arg_len;
 	int ret;
 	int i;
 
-	arg_len = sizeof(u32) * le32_to_cpu(ut_cmd.num_args);
-	buf_len = sizeof(ut_cmd) + arg_len + TLV_HDR_SIZE;
+	arg_len = sizeof(*ut_cmd_args) * ut->num_args;
+	buf_len = sizeof(*cmd) + arg_len + TLV_HDR_SIZE;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, buf_len);
 	if (!skb)
 		return -ENOMEM;
 
-	cmd = (struct wmi_unit_test_cmd *)skb->data;
+	ptr = skb->data;
+	cmd = ptr;
 	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_UNIT_TEST_CMD,
-						 sizeof(ut_cmd));
-
-	cmd->vdev_id = ut_cmd.vdev_id;
-	cmd->module_id = ut_cmd.module_id;
-	cmd->num_args = ut_cmd.num_args;
-	cmd->diag_token = ut_cmd.diag_token;
-
-	ptr = skb->data + sizeof(ut_cmd);
+						 sizeof(*cmd));
+	cmd->vdev_id = cpu_to_le32(ut->vdev_id);
+	cmd->module_id = cpu_to_le32(ut->module_id);
+	cmd->num_args = cpu_to_le32(ut->num_args);
+	cmd->diag_token = cpu_to_le32(ut->diag_token);
 
+	ptr += sizeof(*cmd);
 	tlv = ptr;
 	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, arg_len);
 
 	ptr += TLV_HDR_SIZE;
-
 	ut_cmd_args = ptr;
-	for (i = 0; i < le32_to_cpu(ut_cmd.num_args); i++)
-		ut_cmd_args[i] = test_args[i];
+	for (i = 0; i < ut->num_args; i++)
+		ut_cmd_args[i] = cpu_to_le32(ut->args[i]);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 		   "WMI unit test : module %d vdev %d n_args %d token %d\n",
-		   cmd->module_id, cmd->vdev_id, cmd->num_args,
-		   cmd->diag_token);
+		   ut->module_id, ut->vdev_id, ut->num_args, ut->diag_token);
 
 	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_UNIT_TEST_CMDID);
 
@@ -10076,8 +10072,7 @@ ath12k_wmi_send_unit_test_cmd(struct ath12k *ar,
 int ath12k_wmi_simulate_radar(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
-	u32 dfs_args[DFS_MAX_TEST_ARGS];
-	struct wmi_unit_test_cmd wmi_ut;
+	struct wmi_unit_test_arg wmi_ut = {};
 	bool arvif_found = false;
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
@@ -10090,22 +10085,23 @@ int ath12k_wmi_simulate_radar(struct ath12k *ar)
 	if (!arvif_found)
 		return -EINVAL;
 
-	dfs_args[DFS_TEST_CMDID] = 0;
-	dfs_args[DFS_TEST_PDEV_ID] = ar->pdev->pdev_id;
-	/* Currently we could pass segment_id(b0 - b1), chirp(b2)
+	wmi_ut.args[DFS_TEST_CMDID] = 0;
+	wmi_ut.args[DFS_TEST_PDEV_ID] = ar->pdev->pdev_id;
+	/*
+	 * Currently we could pass segment_id(b0 - b1), chirp(b2)
 	 * freq offset (b3 - b10) to unit test. For simulation
 	 * purpose this can be set to 0 which is valid.
 	 */
-	dfs_args[DFS_TEST_RADAR_PARAM] = 0;
+	wmi_ut.args[DFS_TEST_RADAR_PARAM] = 0;
 
-	wmi_ut.vdev_id = cpu_to_le32(arvif->vdev_id);
-	wmi_ut.module_id = cpu_to_le32(DFS_UNIT_TEST_MODULE);
-	wmi_ut.num_args = cpu_to_le32(DFS_MAX_TEST_ARGS);
-	wmi_ut.diag_token = cpu_to_le32(DFS_UNIT_TEST_TOKEN);
+	wmi_ut.vdev_id = arvif->vdev_id;
+	wmi_ut.module_id = DFS_UNIT_TEST_MODULE;
+	wmi_ut.num_args = DFS_MAX_TEST_ARGS;
+	wmi_ut.diag_token = DFS_UNIT_TEST_TOKEN;
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_REG, "Triggering Radar Simulation\n");
 
-	return ath12k_wmi_send_unit_test_cmd(ar, wmi_ut, dfs_args);
+	return ath12k_wmi_send_unit_test_cmd(ar, &wmi_ut);
 }
 
 int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 0bf0a7941cd3..8d766dd5b304 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4210,6 +4210,17 @@ struct wmi_dfs_unit_test_arg {
 	u32 radar_param;
 };
 
+/* update if another test command requires more */
+#define WMI_UNIT_TEST_ARGS_MAX DFS_MAX_TEST_ARGS
+
+struct wmi_unit_test_arg {
+	u32 vdev_id;
+	u32 module_id;
+	u32 diag_token;
+	u32 num_args;
+	u32 args[WMI_UNIT_TEST_ARGS_MAX];
+};
+
 struct wmi_unit_test_cmd {
 	__le32 tlv_header;
 	__le32 vdev_id;

-- 
2.43.0


