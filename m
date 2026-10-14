Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C97CC6B1D
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=; b=tXuZlRv1bs9r4PLpUR69OqyeEF
	qMPvCVYyu+prnVp3vAIpHa5sADJJ2xqRjgVPNm0hOjMlYcDn9Or/i/T8iVBsDtwaBy66y7fOf5ZLO
	H5inqHBEq4sIg6ED75ba/sQXyMeaH7nUo4NkeztbkNKbgZTfNEraLY1AQtgSlbVezC7CzB9zNcVw7
	shMyRF3QcHmTuH1AI5eoc8ZfBzFirQpSyODu/AumCbp6PXMBWhr2v1trwgmx3ScRG7Wh3v2D+880U
	Q61AWX2p3QzNKc0FepCWRHebSVgw7v3FLglCPxIDHTaPIaN9Ij8lxQsjW7RjUJwvhUNglturrWXHf
	LcyhAKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydg-0000000FWT0-0umT;
	Wed, 14 Oct 2026 13:03:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydW-0000000FWPh-1bZK
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=; b=eYSl7oXC2xf+q/bXtt53P4+J6Q
	2oUgcPsPZPmq772ccrTZDlpmWg5L/0NjvdxRkyZ3OaDXLMB3V4Y4URqMWBm+mfhmDCBXt5P0iqnXO
	aph88+H60D0DoTwYsiwmxcfw1cD/ykqytgqXcXh3DKHLfqaUVER27f3gcrja7BXYl9yZtr+4TUDeb
	SU4RJEajDjCtergLXftxP8VNdwMrJYwSvyrB3r28n51dMSj+GWa5xwuacRN1tGpgWSZxMGL6BKKR+
	3h8TVJE8qyWJeRR6qUjckRQC7SrE6wkxoKEgLqojwgxmEbCb7as7l33BMK7CjA2U5Wvw6rPQnERdk
	x16SriPg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGydS-0000000Gmns-12yZ
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 13:03:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAQB0R806699
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=; b=EsuVTKBa+BPJWbGJ
	C6iV8zppThQzhk42jtzuOM242Lex5uB97yEBabka0Q/Xf0W42WHvDhq82FUaQAc4
	MpyH/jqWMUMn7vN33TZ7ZUJZR3GqcPBLgokQFHA0fYBhH+bHF2/C6WBJATq+RNue
	LyHNpTLiFwGo8KrlVYDb46G8NlgnIppAHU9MfSmax+e21cag1CgPvCIb2YiIIYoC
	nTAUoT6lQDXky6r+EL/4lQBbMt3PXA9AGA/6NvsKV6Ix6GfJap6HnHjS77aB25Qq
	Dn1CT+wBQERBdVy/5X/Lj+KLGPdZ0uj945rH+akIumPj6pZHcNxdRNUvOWEbnBBL
	eLa9ig==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bjsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e3ef255ffeso714727e0c.0
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982987; x=1792587787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=;
        b=S9dsGcQW10cUN1jkuOf2aQdd3Rz6MY9ks0ztq2yUp4PGUkEAPaDvvUTx+4FGhViLGW
         WS2zKLM1uKygy56eI6W860B/7EQaPHgGQye9JWVF3Gas98lKSgmgTISRFo2WfNb1s3xW
         08IUCO73h0B4afe+yRqAa1PCiZTd3MPa6h9DwzVvs+Pq/qmrIgacZAERKsA4uOimYPze
         MSTKwhVnPE2AnsCki4s4QDICJfMf/BfaFdNfGcNj9xs8kfaiLBAIvDQ9+pFqwa+WrbYf
         rMAkPzyALzCsRgc1lV3Fdwu7hzMoePvurEKyWLjF93iVDUFabL2PKZkyT1srb70ciZ3W
         zZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982987; x=1792587787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=;
        b=D4PUfAwkkGrY5hcLeEHe1jwyjytB3/bH9GZcuSuZFbqrdQJnnwSVgrnge5igsylZqY
         C+qJFtZvw6DT3JkkNP7gsPi6fqhGcZVHRUZAvYi6kflGPqYZO1LcHAkY/wqF+OyPnLm0
         b9tQWpwJ3gLr+jIlRoVhT7ZHnhQ60aUlw1+PiH8RZCTaPeB/+3obVIiG2lgYjAAX2j51
         /6coWDBjEUC+TJ8DdnKv5uxx18eQlW2zS4JCSXW+Q25CAWI27lphysBptbxTwck62dVZ
         BjepB7ol0nXMPiG9xO8Lqpb1MPZx/rS1ZAHtUw0tdiQYnNZAxtydUjgV7MGfFn2yKYvU
         p9qA==
X-Forwarded-Encrypted: i=1; AKwUvBzj8ISscfAiMHq6ozfcX+ngcR75wrYT/3VpQ7vQXBeqCHX2OVZyhnxEv3izv2NoBotKhsAxrfo=@lists.infradead.org
X-Gm-Message-State: AFq9FYIGBDBP8RsR2f0Gu1lk5ubuBy/K0Wq/MwpdKz8l+FYvoMa10Pha
	4SZSDg5d6FdK8ZjQKqStWZo+djlpxXRL6yi45uj5M4dBQ6pBlqJ8xwO9cHRtVyMiQs8w79OqZau
	oj1O0lx04JVjEZr4f/ptnG/5/vfDIHIAiDDA9Xi5+qzYlYV1DXmg69jAUNMDnw8fl
X-Gm-Gg: AYBFou2g3Wb4+OI4smy/AV4u/04Wrd6IQbhDyQtbsR4otvNopxBgJeTFpkR3ZjaVzPa
	FG8erjslvvL5+/8FGAkwSCEP3oKQp9GeGz4gBDTEW1I/F/RWPYryPPyDlb/1eCO3dRvNS5xrwha
	0QBsxgzIRwNDv9/gma0pQI7Lh09bzwzFcVSb7x47+Mnu/2JkE+/SLuq/8oBVhqRP7KkI1a2w+Ui
	Zk7PgcZD/ZstVGG3N1+Eu+OYUQH4Hj3uCf27HYy1si9SYYE5zacvjQnp+ZaYfCkVmqmjcBLj9pk
	07Vy9NfhAU3OeEol3ncOPdi0pJOxVdAb6PlmJTLg4Cz8D0RcapQkmBceZ2otEvMXda/AUOLVZ6F
	zyoRkeYYdog==
X-Received: by 2002:a05:6122:1828:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5e91f46ca9amr4660014e0c.5.1791982986714;
        Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1828:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5e91f46ca9amr4659950e0c.5.1791982985578;
        Wed, 14 Oct 2026 06:03:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:41 +0300
Subject: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=M65grMqA0pbQdU4QyJoVu4Bgle4ZA4GTDxdFGfP4iCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz317IP/RgPiFebMABWgpRQA4kfAxNpiWKdFo5
 nyL124My0aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99ewAKCRAbX0TJAJUV
 ViGxD/4n6SfiXmZfYHLfCeUDnUW3mv0CjuulX8LDaae1+UfNKgq2D94MKSPHAq908uFKy8M3ACS
 8DfA+SIbA95s/9QIamiIEZJhTyg8TpeZbzHTi3lj107xrKggAI85FudtTGjV9P4SaWUJNxR5IrQ
 XuCckMQWmRZesiLQaLZyZDrlUZEXVSi7kFEfw8aQV0bUwFFxe03NuxkfCONUipyohb14bMOz7+D
 tgTn6EO7LKZosyaY+4bnhyi2iueZEteOgPN7JC5dd5heheXIyhbhpR7m/gXQ/i20Nr0Mzr+IXSR
 QZmzceVn4hdEW/37uzJLcXdKtboeq2ONnycBsL2mwY8iMdH5ke7urm0DHXSktdl32F5bxHvsT8F
 orvrvmk6GSTuZWdKMr2YAfyo5Gyo1nRfRrr2dDUle4fJTJmFb3kiKhTh5UvunPj2UpVeqmXuJcJ
 d07Q2lNWp+wH87irkbyd7cKFJQ/WkwTvmacXxpdXe8wIqvriDLwsGG+bYzZUyPLbF73JtHDlXB3
 lJVm4uST7oRbRxr53+f9xCWnbICzwnmQmE6967SUaK+TL2gJEEf5zdhL3XTmc35je/Jxhq+FT+W
 EurMZI+mGnTYvwNTdprUK2sW4/ORcB6j+wzmndEhnrwi55cgs2wbJKsi4tlLroyV4YOkxJSFvap
 EaYk+c/iAwqdZLw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: oVBN-FeRRc61H3JppHDuMUapNLzIGgzL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX6TxPBu2Fyi8Q
 S84EQ28uMGuCUsv/HOPBMs/f/FaS+UAPbKvxwL3SwNzo0WvVxD6MWv0VNjirkpsBQYtgi8kgoac
 bgZNqxZvK5BCNXLB3IkFBh5KsqYQzIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX4SIOw8VJyN2w
 W8JIqydmNRPTYtVH0hnC4WgUwPZQtU5kVraZJeybGvmSr/5j1Gl35TA3p6Ethg7qh/D2nMR4v/c
 ucjqhM69gZCYZPfU7XZYC70whsoSfeAH+7BtpLTvrP8ZY2ceHpcnIgUnxkdviqyF+bdKTSqQ65F
 SY2+zcyYdnXOUD1z17HiVpP5m35EGfPC0FPovAUyOpblPIgcYUreXARdOoSw6eFlIxSnT6ClqBC
 uPHFwHuf6ie3xPfZA+vBthWnoVNPzB5AlifrLV85Jr11d2xa57Z81P+K1W7R2ADFUtTOoqGE/2a
 miPkB74pQFajv068y4DFREVZ8FcC/mCCDhzlcLtU/scIKLZeHHnUj9S01yMgGuudCetOhTexEH7
 1PtYHBkCQRnUD9aX203GYC2Q9XIdAWmvlanvpHJyA+YgXaEx5Ys/HEzLTBYqm9ASvfCsebN57Cm
 ahJHNUUXkUp1c4rlwAQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf7d8c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e97J7Y3cOKKqNyIg4ksA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: oVBN-FeRRc61H3JppHDuMUapNLzIGgzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140311_784911_E1D7E0D7 
X-CRM114-Status: GOOD (  19.15  )
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

Read an optional Bluetooth device address from an nvmem cell named
"bd-address" (as already supported by hci_ll), and program it into the
controller during setup. This lets QCA controllers source their BD_ADDR
from firmware-provisioned storage such as a UEFI variable exposed via
nvmem. An all-zero value is ignored, so unprovisioned storage leaves
the controller default address untouched.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..b704f4c3e1a4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -230,6 +231,8 @@ struct qca_serdev {
 	bool bdaddr_property_broken;
 	bool support_hfp_hw_offload;
 	const char *firmware_name[2];
+	bdaddr_t bdaddr;
+	bool bdaddr_valid;
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
@@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
 
+	/* Program a BD address sourced from an nvmem cell, if provided. */
+	if (qcadev && qcadev->bdaddr_valid) {
+		int berr = hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
+
+		if (berr)
+			bt_dev_warn(hdev, "Failed to set nvmem bd-address: %d", berr);
+		else
+			bt_dev_info(hdev, "Set bd-address %pMR from nvmem", &qcadev->bdaddr);
+	}
+
 	if (qcadev && qcadev->support_hfp_hw_offload)
 		qca_configure_hfp_offload(hdev);
 
@@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	qcadev->bdaddr_property_broken = device_property_read_bool(&serdev->dev,
 			"qcom,local-bd-address-broken");
 
+	/* Optional BD address from an nvmem cell (e.g. a UEFI variable). */
+	{
+		struct nvmem_cell *cell;
+
+		cell = nvmem_cell_get(&serdev->dev, "bd-address");
+		if (IS_ERR(cell)) {
+			err = PTR_ERR(cell);
+			if (err == -EPROBE_DEFER)
+				return err;
+			/* -ENOENT/-ENOSYS: no cell configured, ignore. */
+		} else {
+			size_t clen;
+			void *cdata = nvmem_cell_read(cell, &clen);
+
+			nvmem_cell_put(cell);
+			if (!IS_ERR(cdata)) {
+				/*
+				 * Ignore an all-zero address: the backing
+				 * storage has not been provisioned.
+				 */
+				if (clen == sizeof(bdaddr_t) &&
+				    bacmp(cdata, BDADDR_ANY)) {
+					/*
+					 * Per the device tree bindings the nvmem
+					 * value is MSB first, while bdaddr_t is
+					 * LSB first.
+					 */
+					baswap(&qcadev->bdaddr, cdata);
+					qcadev->bdaddr_valid = true;
+				}
+				kfree(cdata);
+			}
+		}
+	}
+
 	if (data)
 		qcadev->btsoc_type = data->soc_type;
 	else

-- 
2.54.0


