Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D1BF34C64
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1BnQnX86bcOruLMnu2cKRSxiljoYASvR8mTo9FcWZs=; b=qzx2TfsqbeNoTPRpXEbScEP/wS
	rgYeuDuBRyq9cMxJAQkNv2ExQmws4yxnNpw+cYcaJXQIYBmT20XdWsShg5h0dsgcRvERmNHuyg0EZ
	t8NOKJaf2tdY0FCL5nt6br/oGoEcvzTx84ANI1zGM5YniNk+Tf+s/uwVyx4fbICeE7NNU0udVVici
	lJeESpqR3QEWezIcHORv3avzuywWKpkflSO2PMtfu6i1kJx69PSDY5qhOrR1XaohxkdNapt8AvPoi
	VPAV7zhdFVJqLPV4TQbKZH1iDZ3TzuLpd1Jcejs4hfRNfecMPrvS8Iejs6w1929iP0SifUYWE0pn/
	eycWL+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJOB-0000000Fz6P-3Zim;
	Mon, 13 Apr 2026 15:39:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO8-0000000Fz3n-3Nis
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:39:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDm3xc1496789
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K1BnQnX86bc
	OruLMnu2cKRSxiljoYASvR8mTo9FcWZs=; b=PH1kTrzauPJ+uJkxbK7uKRy0X1H
	SvtSTtbSwc4t4L8DgTxVeJJ0a3h7FNu+Vz0xyFm5u/tz255L413zfRVTIMVFQhUn
	KnIFG5hX3eyVbj+utfQOorIkVwheHMFck9f3nqKCYFGt78FYjr+3DfUry77n44i0
	mn7G1SBX3F/yGyyPkrX4tNtINJA4msM1A5KJgW+C4HuVCq1F9BzhFoF3M+UHP03W
	EdcYKt6xHQh/GJHLW2FOX0NUnPlNULXxFyavCugf1abipLGQnJn72pTuZB9OhSBl
	D+mQydTGvcgl4sICJ+Dn3NzWzBXOGH/CVTwdgEhxkwI3wFhK1LIEtz9mCTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk8e2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso10153621a91.1
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094787; x=1776699587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1BnQnX86bcOruLMnu2cKRSxiljoYASvR8mTo9FcWZs=;
        b=i+jeBaUDo1ep269U2Jg9j8xQUgA8Jra5CE+56QM7ssjxCX7fFDQ5BT/josQwUBOahw
         /8mm3xMWekJUFzn5ZI/Kc6QECykY9J/12HQq80SRl3KdsdVl1h/8fNGYFbEUKEjVWS0P
         IY2seFYg7EKi3xYJcHuzYuSDMRB98oyYRUu7F00FLlPCPc/yfFQNwbIUyZ8ijb4lzgvv
         yXrkLnXbA+Bi7panWFcv/p6QYoOlb2wT8hWmvTgwbZ+9ypo3Ds8sB+v6Ibd8S71uohOW
         yLaQmeVGGN2gtQ8LVz2jvV7PVlCGpXImmwN6O55rfamQBp6RV8zw1+wUY7TcfEPVB8h8
         RBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094787; x=1776699587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1BnQnX86bcOruLMnu2cKRSxiljoYASvR8mTo9FcWZs=;
        b=FVYrva0p/xMskpfEtfKDuLmEkslb1hajv3MWbpQ0lOGZ+y4GO6uFN3O7GmHvo4ZV3S
         MWtuvsqS3UxbuSf3OEfqN3nyZLqhaADYBdtGB8AasmM+AvqVWK0slG3l+PTRH6g/l99g
         zNsd1IC3EEwgx9/3GmNIz6sPUl2rs5WGXau9xZPI5h+DSpcz1GFoXxQtWHlVMVS40X2/
         pIG5CHkGV46w4EDmYyCW1dumkoKGN4gt9i+VNgjH339iqpONQQ/tcwErmf4jvelGcC7G
         lyAMWYoigIhq5OV1H3VOx8W0piNECoIOcjYBJVrIMatzjAbgkbSdorna9I3oiPtCZAR9
         Oalw==
X-Gm-Message-State: AOJu0YywyXyUSho5eqhjhED9ljYMfRO6X5M/sUjnWXz+8NHV/imIwTxY
	h0m39krOdaImYiprDNQ7XwV2gokWE+BcA646qZwNbRg8uqCaFxuCr6yHDmmFF5Kyc0gAU+a6lW2
	bheP9Qj7eloMtt4C3iD+HnCu/cCJdUZLjWvpsM4X2JgP5PryPh4252CMIxTvmslFwtsNe7Xel
X-Gm-Gg: AeBDieupfnDJjjLPgvmEbYy5GfJBCsYQWWVDxqvmENhm74IWs081kSsDSmRD4eVm/0C
	nrE/xpwMUMMA1n21OQnvbKyZovmqeLVgDvzt5TPJrbf1gX8geWWRfOFslowC2MPjjGtSAgjixwQ
	y1aud5QQ9InW73KyzIUSMOwZuiw+/YASfOsuoiOJfUG7BhJJjmhSJgWbeqat5iSHZg55pM2AJiD
	gcPV/Z+smJVijaAazi3tMWwd1zACZj6dok5YJOOMxTfeCtmOb/xMzGzmxtugteXv0KuNb0kwcC/
	RIzuFqOwxm0K3LCAic6fDaJb9/EZNFJWjP5WBqlfumSRlUiKhqlP3E3lGyda6jDXVvADrr0dT36
	TjxdFzz8gETOrM5FRbhg8zSLBQLjXpxJUvV/YwSHjF/jWp8yy2egdwqcp+X1ezUPc4VBeWzxuH+
	nfqz9rYc6+R0rhKWV71nGAWZCiuv6b1BZWDT32nTIL84Elm2hytkE=
X-Received: by 2002:a17:90b:2892:b0:35f:bae8:3531 with SMTP id 98e67ed59e1d1-35fbae84a3amr3132583a91.25.1776094786495;
        Mon, 13 Apr 2026 08:39:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2892:b0:35f:bae8:3531 with SMTP id 98e67ed59e1d1-35fbae84a3amr3132566a91.25.1776094785974;
        Mon, 13 Apr 2026 08:39:45 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e411ff4e1sm13000123a91.3.2026.04.13.08.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:39:45 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/5] wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
Date: Mon, 13 Apr 2026 21:08:39 +0530
Message-Id: <20260413153840.1969931-5-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vI16MKxg0zRbhOP7w0o5MscjdZMpz-xG
X-Proofpoint-GUID: vI16MKxg0zRbhOP7w0o5MscjdZMpz-xG
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dd0e43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2ln3ysbViG1LyOe46xYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MyBTYWx0ZWRfX83eheIMeZfoR
 GxnLVB9tTYL9YIg1wUAiuxFiBRjaTaBCIDPP8csAhMwgoIdcWkzYOWZwBSlTw/vF5blsENetTZN
 3jUhwm+L3ZIa0kZN1TlwRvy0Q9tqt0Dh7NmeTvpgbt6EQnabq0NpQN2Y9gDr0LPsKjHjfjz6HnV
 X263CfSeYuHq2OH6A0xnJdDKF5FDgsfaFikMEVuObfT86+MPeh6ZVtiG1jVUZ/p9kbRHYbPhFbr
 7Ug73RHuiEzTvzRwOvVCF4WXAn7KopsvAI1Jg4FhvlEwLrz3D1hi6vityxGudL4wYU2q31/VdUk
 Gsg8h24ggkFKFklY0YbLriBOJZsSW4yFOd3PsWEE+BvqnGHKdcKSD0nrLkhgwcc75CtRZYrkQC0
 8DOlloqKnAwpU5F1kQFti2Zg/mIq+Ew59RMFtt9ULQchz9aaH8cNdP+9Ew+XUxAoXxMGGEn79Ce
 6ADPCt4HhP3uE/w/Dew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083948_965928_C084A28E 
X-CRM114-Status: GOOD (  16.80  )
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

A later change adds thermal cooling device sysfs under the wiphy device kobject.
With the current teardown order, MAC/wiphy are unregistered before per-device
cleanup, so any subsequent thermal sysfs removal would run after the wiphy kobject
is gone. That ordering is asymmetric with setup and would risk kernfs issues during
removal.

This change also adjusts the position of ath12k_mac_mlo_teardown(). Previously
it ran before per-device cleanup/MAC unregister. MLO teardown issues WMI to teardown
multi-link state and is part of the MAC teardown sequence. Placing it alongside
MAC unregister (after per-device cleanup) preserves setup/teardown symmetry and
avoids racing with remaining netdev/wiphy state.

Reorder hw_group_stop() so per-device cleanup (including thermal/hwmon sysfs
removal) runs while the wiphy still exists. After per-device cleanup completes,
unregister the MAC (dropping wiphys), run ath12k_mac_mlo_teardown(), and finally
destroy the MAC. This mirrors the setup sequence and keeps sysfs cleanup safe
when introduced in a later patch.

To keep start/stop symmetry, add ath12k_core_device_setup() to encapsulate the
per-device bring-up steps (pdev create, IRQ enable, rfkill config) that were
previously open-coded in hw_group_start(). Use this helper in hw_group_start()
to match the existing per-device cleanup helper used by hw_group_stop().

Note that set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags) is now executed outside
the ab->core_lock critical section. The core_lock has not provided protection for
the REGISTERED flag, readers do not rely on core_lock for this bit, and the flag
is only toggled in the serialized group start/stop path using atomic bitops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 50 +++++++++++++++-----------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index e8137144fd1f..1a9866061f82 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1006,6 +1006,27 @@ static void ath12k_core_device_cleanup(struct ath12k_base *ab)
 	mutex_unlock(&ab->core_lock);
 }
 
+static int ath12k_core_device_setup(struct ath12k_base *ab)
+{
+	int ret;
+
+	guard(mutex)(&ab->core_lock);
+
+	ret = ath12k_core_pdev_create(ab);
+	if (ret) {
+		ath12k_err(ab, "failed to create pdev core %d\n", ret);
+		return ret;
+	}
+
+	ath12k_hif_irq_enable(ab);
+
+	ret = ath12k_core_rfkill_config(ab);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	return 0;
+}
+
 static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
@@ -1015,10 +1036,6 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 
 	clear_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags);
 
-	ath12k_mac_unregister(ag);
-
-	ath12k_mac_mlo_teardown(ag);
-
 	for (i = ag->num_devices - 1; i >= 0; i--) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1029,6 +1046,12 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 		ath12k_core_device_cleanup(ab);
 	}
 
+	/* Unregister MAC (drops wiphys) only after per-device cleanup */
+	ath12k_mac_unregister(ag);
+
+	/* Teardown MLO state after MAC unregister for symmetry */
+	ath12k_mac_mlo_teardown(ag);
+
 	ath12k_mac_destroy(ag);
 }
 
@@ -1165,26 +1188,11 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 		if (!ab)
 			continue;
 
-		mutex_lock(&ab->core_lock);
-
 		set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
 
-		ret = ath12k_core_pdev_create(ab);
-		if (ret) {
-			ath12k_err(ab, "failed to create pdev core %d\n", ret);
-			mutex_unlock(&ab->core_lock);
-			goto err;
-		}
-
-		ath12k_hif_irq_enable(ab);
-
-		ret = ath12k_core_rfkill_config(ab);
-		if (ret && ret != -EOPNOTSUPP) {
-			mutex_unlock(&ab->core_lock);
+		ret = ath12k_core_device_setup(ab);
+		if (ret)
 			goto err;
-		}
-
-		mutex_unlock(&ab->core_lock);
 	}
 
 	return 0;
-- 
2.34.1


