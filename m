Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26043C54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/q4AL3UqHmQiIbXfDF4U/jvRnNoEITC5BmiuZkEIC4=; b=sA/fW7hn9ujSVeSf4T0MngwkS/
	vrzr1DixUHP6N9Hwd/6HPpi/sg8KCUmxArTFuSSPWDLdV3lNql/m5/qcHuKJv2t/iu79KLI2kTUyq
	nZtWZwy/57jC5RZ+Q+O6q1n3B67jiDGc3J0j4M39PaPBDCtoBpX70ejrZ+hfNZBD1OwEJdRWJem47
	W1OsBZ44GuiDzv43ohJD2b2HdoQKBrFUvB9RbsAlj46EHoGvjR+VSFK7xRiKl2P9vOTt3GV60XPQA
	InXBzEnKMTugOFEIenX+hvd5q49CnYIn9bY4Z8+JF3QlL4WfCl9I1lTJyNXFg3LBf+wxDCpOxW/hL
	Veta8Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYt-000000076A0-3WE8;
	Wed, 29 Jul 2026 07:18:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYq-0000000768Q-0ccZ
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 07:18:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5gWLD2055172
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/q4AL3UqHmQiIbXfDF4U/jvRnNoEITC5BmiuZkEIC4=; b=DBvcsEoRnd4gnwi3
	T7ylSpnozhVcNg13SYqFhhLMJ0q3wWBQsqhdT0EZy/r9EQSKaTBieCTR5IKWQZyH
	T7wt2rh+Zon8FKYfAwjzZOdL2qjOjrUaTC8w4zy7EDRBLN/F5M2s2VOSBRWYIU05
	NMuw399qCYvjNYc/4m1ljOldru+cDaLozax+EIVLLG5gWqHGtkVZjeiY9KFIffaE
	Vcm8VaG/3c1vRD/EXuYOH0oBa1AXgP2+EyB2UCyEQHC8eQ5YF2sz7AzCn2NekhPU
	5MNwtcOWWTG0ryNJAn9CAwEk1poPGvoGlOkOkfCbQEIQ0S5cixrkuV6pmXbaU3vT
	aCsl6g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1gbxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso1142648a12.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 00:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309519; x=1785914319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/q4AL3UqHmQiIbXfDF4U/jvRnNoEITC5BmiuZkEIC4=;
        b=Ood8dmUG5YfWAZMC2qsQAfa6XcibXRHwov5igYA0w4QlTt+yzqbPCp6cHXRcPesCU2
         ckVrwSNS5ODSpLaUkUfxXuwgf4T819gMqzeXQtQhrS2YkLfxJZC+XjemWP07Xhl/Ueiy
         fF1zPWnZO9OE97lnP0oJW+ddPsulUAkTRkCJp15Wdsj6FZMR8L3bsYn5Rd6rfdZjlnJR
         bPdeajW5wGLvQZXcm3ZoUfoODMnJPJ1DpREp02j0hmQgCXiw3JoqWMHxImpJeQzJA+sC
         dRgmRrbRyrG+5aOdfrt9gbHf1vkYamO+MT8KCd6T5wWCXsVC89iicr9LaPH8fqRUlzwq
         mURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309519; x=1785914319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/q4AL3UqHmQiIbXfDF4U/jvRnNoEITC5BmiuZkEIC4=;
        b=Ox/aSMFK1DbCktqAxJQNuVxlSOa5f13E7IuqPATSHb38TKKF28jDD9S3z8HRuwW8G8
         XWWmn7i/BhjCUi+EoADJsbX6V7pF6vzqBvnNzSslN+1yuZcc6kA60Dm+1DINc1+T6+wJ
         ZJzpoof+9m8lPGROhojMepBId5B9WtB4IhOGAhJ7NmOdpeqTBilJ2bN3QVED8dlhVRTu
         9lEj2V0CbgLL2FN7iSDfH0tpft9KplciA3/UhQ5chFNbrGvHQYW+J2Hx8ng7Jkg5UGb7
         +w6qGq+lAhq9rZTDBr2wO7NqKQKMRx2MdVkfKR8x+mJrXI0oPLerBe0BOS2NhpqJ5yl+
         yyQA==
X-Forwarded-Encrypted: i=1; AHgh+RqlCaHmRprPcV3Xnh5ZpfQmBCeV6kjlCaJdW0e9/08XGh6lXCKHug4Yv0WAkQSgNN/SQ5lfQ3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNxnm1Zd7173kKpvPQio1GCq6RkeziOgPuuo6jOdNz0JzBGYAU
	4P6rQ24pd4pUahPKCOSeRkoc8jdZus3HtcbdqK5eiV9EjrkBr4DhBisEiPVdX1b+SOPqpvUW162
	NO735OVYMl/Zb2xjVi6PEg12lBT5gdTqZw+E/8LfY0PWtH7YJ7oBi+35YFQIgOI/q
X-Gm-Gg: AR+sD132VKCzaCTt8W8BQ+YMmmmhZtz11PDPOgP/UfCSLeQvUXmPxb+wOp5AEQtGldo
	au8fwlhUpH90LpEeStAPNFfn8XfDqOw2jNRT9XFgl0I+WH7iDneh1+lcPRMc2FvaYhCJ1uc3ohS
	lME49UEZfEHobvzz0X2C/OkTPnGeSXOCN9SGg/IlUk0kXAXEahD6TsXJcsuAGQJjDuTmGFpI35M
	bnoKz555q9s0ollDOzqQGnlm1VQLUOlKTgjrWtkkKQve7TXR/6AHnZqVOH7RQI94j0K9cAkLFUP
	dNTlN4zcRh/gm0W/oU8RkF5IgBfCHHqivdaYKnzUbQeGEgaUNCxzy6jMWyCTIP8fPhJntVLYInt
	TnhbEVglNxXm9gJBzt74WwJc7LEVmWT9g8w6447RE6Nr8DSVuAJmJjA==
X-Received: by 2002:a05:6a20:2d09:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c8aafc03aamr7355005637.1.1785309519118;
        Wed, 29 Jul 2026 00:18:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d09:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c8aafc03aamr7354981637.1.1785309518744;
        Wed, 29 Jul 2026 00:18:38 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm474793a12.1.2026.07.29.00.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:18:38 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:18:13 +0800
Subject: [PATCH ath-next 3/4] wifi: ath12k: protect new_alpha2 access with
 base_lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ath12k-regd-wait-timeout-v1-3-504aa6e7e93c@oss.qualcomm.com>
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX5xmUDC0QJMsS
 0gGb2zM+zSltFRb0KHtwxN3I+1kNO16zCngToEFIfoeyBdcm7NwcxiCNYM9Tn8WaAkLbA0L85E4
 SEmBVdh8GbKzzMH2wUoDik1mgIFwWGG87zQbLOf6jwL0qkD1TjdKfc1GZWTsSGSEyb6R7qKyGtn
 PpV57SxJ3gNhtTJtHrT0fvmG6NnIE9cr+H5VZ0JlLuGbHSE/kwRRIVQbtnR3dfDt9f93eiy88ZF
 JJjilc91Y122Q91nWGKsCzc0CDnGEOQbiq0X5eb6aqxliNsHdcUKSWf5YEw1kMNfxXrHQTn5p9q
 tcg9zr+BybyK4OUfwPZjwYf7ugONz/g2SMndrU6kXMUF8gQPeqf+gvLj1itNGfZxXBb0klpZegC
 7momeiJMngZebVA16N9YjoFd1bTJNUavad/rOSQTuMUJaTCyPAtsOrrqI7735ztCzVNWd1NePvu
 QWqdMsxyTB1wuE+sCbg==
X-Proofpoint-GUID: rOA-XG0Tr5naWt6MRXq0eLB-hxHOcvx2
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69a94f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lPJdulcixYuF9D0iInEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rOA-XG0Tr5naWt6MRXq0eLB-hxHOcvx2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX7DRPIVPtl46h
 RWSZB6xEXEgBwQUVBQb36icR7GaKimKu9U3GeGLqHKUyGRQuxz1MOw69ebVV/HAB93/WdNeYnXv
 +z1XEJmj2knarYSNNOnT8D2KKokJsMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_001841_098256_66E3273B 
X-CRM114-Status: GOOD (  13.43  )
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

ab->new_alpha2 is written under ab->base_lock by the 11d new country
code event handler ath12k_reg_11d_new_cc_event() and by the SMBIOS
BDF parser, and read under the same lock by ath12k_update_11d().

ath12k_mac_hw_register() however read ab->new_alpha2 without holding
base_lock, racing with those writers. Take base_lock and copy the
value into a local wmi_set_current_country_arg, mirroring what
ath12k_update_11d() already does, and use the local copy afterwards.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 82cbb5b9cd11..56f9c1945cf0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15052,11 +15052,17 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 			goto err_unregister_hw;
 		}
 
-		if (this_ab->hw_params->current_cc_support && this_ab->new_alpha2[0]) {
+		if (this_ab->hw_params->current_cc_support) {
 			struct wmi_set_current_country_arg current_cc = {};
 
+			spin_lock_bh(&this_ab->base_lock);
 			memcpy(&current_cc.alpha2, this_ab->new_alpha2, 2);
-			memcpy(&ar->alpha2, this_ab->new_alpha2, 2);
+			spin_unlock_bh(&this_ab->base_lock);
+
+			if (!current_cc.alpha2[0])
+				goto fw_stats_init;
+
+			memcpy(&ar->alpha2, current_cc.alpha2, 2);
 
 			reinit_completion(&ar->regd_update_completed);
 
@@ -15067,6 +15073,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 					    ret);
 		}
 
+fw_stats_init:
 		ath12k_fw_stats_init(ar);
 		ath12k_debugfs_register(ar);
 	}

-- 
2.25.1


