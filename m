Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D8C02191
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O86IUGSvbzSBBPJGLArO4moxmwy/mflillW9udl+20U=; b=RPNSrct8ejwBYpQDHwvPp8AZ89
	vivuc6q5qafpED+ckPcIgbuq/Y53F0VeqERZsexGAs0ceZZnjo22DxSLfyLT/2xdFwPzUT9MlO3PP
	/kPagw6jAoPCtP5Qoz0dUtB0shmCu7T7CIoh30a0cE6Jegwzr7siUk10iuaReug0onKJHfDQYadhr
	d3kqdxE3jd9daUG1h99LwxNmChX9jL+/pJzP4djsh+bdEmAnZn9VIn8js5H03QdXBVSVgIjQmmXUa
	v0rwPoooLnqVJqCLw7FmR8xU5U+IIjku6iLBdzxsFIo/czo1CEHuf+KQ59uBti+Q04ZWZILCmWUZG
	w0RsiDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchcY-00000004TAC-31uR
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 09:10:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchcV-00000004T9s-4781
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 09:10:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1rXK4030333;
	Tue, 28 Jan 2025 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O86IUGSvbzSBBPJGLArO4m
	oxmwy/mflillW9udl+20U=; b=TyziFVp1GfdZ4ErQcBhPg4eVlV7ijsYFVNaC0+
	rtHMyduL/09eOcjCCfM64lD7lZiHcz2mVh0slTfcQQcuuu48sTsDK09bRUqLsY2M
	7HDsRfWi78XT1lifeDvUIHmRXztfuu2hwDSGQBDB4g/x7EguozIBu0SB+S3WgXpT
	ETUrBtwgwkHpRrSPnx3ZAIkelMmiW9ZuxShidBW+P5vnTxUpH8Vp51K0Yh6nVxbe
	Y3scyvNUU3iDr9Ocq+E0qnWxLpEF8PhucL1Y4SM+KVYvCif+HXsY6YXX9TEXzUfX
	DwyHjqZVDbvo7JtwxrIcIHSrweZyTogx+BdPv2J/BwUE1Ldw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq0qyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:10:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9Ao1e029469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:10:50 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 01:10:46 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 0/2] dt-bindings: net: wireless: add wifi node for IPQ5332
Date: Tue, 28 Jan 2025 14:40:10 +0530
Message-ID: <20250128091012.2574478-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oTclhi1ceqE9v9nZuEXyXPa-ij4nACG9
X-Proofpoint-GUID: oTclhi1ceqE9v9nZuEXyXPa-ij4nACG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=731 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_011056_122680_57B5884B 
X-CRM114-Status: GOOD (  11.90  )
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

The IPQ5332 has IEEE802.11be 2 GHz 2x2 AHB bus WiFi device. This patch
series:
- Describe IPQ5332 WiFi device for device-tree binding.
- Add IPQ5332 wifi node and required reserved-memory in RDP441.

Depends-On: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
Depends-On: [PATCH V3 0/8] Add new driver for WCSS secure PIL loading
Link: https://lore.kernel.org/lkml/20241231054900.2144961-1-quic_srichara@quicinc.com/
Link: https://lore.kernel.org/lkml/20250107101647.2087358-1-quic_gokulsri@quicinc.com/

NOTE:
The Depends-On series '[PATCH V3 0/8] Add new driver for WCSS secure PIL
loading' do not apply completely on ath/main ToT. One of the patch
(https://lore.kernel.org/lkml/20250107101647.2087358-9-quic_gokulsri@quicinc.com/)
fails to apply. This patch does changes in the file -
arch/arm64/boot/dts/qcom/ipq5424.dtsi, which is in linux-next but not in
ath/main as of now. Hence, skip this particular patch while applying
depenency on ath/main for review.

Raj Kumar Bhagat (2):
  dt-bindings: net: wireless: describe the ath12k AHB module
  arm64: dts: qcom: add wifi node for IPQ5332 based RDP441

 .../net/wireless/qcom,ath12k-ahb.yaml         | 317 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts   |  56 +++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         | 106 ++++++
 3 files changed, 478 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml


base-commit: b5aeca2e66899430827b8afcad061201f3b7861b
prerequisite-patch-id: d59a64ae7cc13f19fc6f27f8906c98ff5f97f3b2
prerequisite-patch-id: 6c4774dac182e3cc7fa830c06936e34b2c3f4e21
prerequisite-patch-id: 2ae372ac47365309e9d6a123dc9db69bd0f81cd7
prerequisite-patch-id: 4feb9dd9bfff074118dc0ee327b53a45ddb535bb
prerequisite-patch-id: efdd81a1f3309e3383ed996f3b1ebef8d2680705
prerequisite-patch-id: 2fb2bcb350efe9cb0f85aefa1849fccb5e13ebd7
prerequisite-patch-id: aea510292c2387e214523d6aaff52298f783e342
prerequisite-patch-id: 6ca17cf991617a9c5664b812007547e914f44562
prerequisite-patch-id: 74dc586eab1f42e73d53730084bc38be4677b816
-- 
2.34.1


