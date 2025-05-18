Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDA3C3ABDD
	for <ath12k@archiver.kernel.org>; Sun, 18 May 2025 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL8DBcm48fjZT4qgabvudsfE3bZaf+cmnGd/EUz4ouc=; b=McALYREd4nsaVGip0Yzutgwv5L
	A9NPnA3NknF+UIhy2xindiUxcWVyHZQr7+V6R1P5Ej/J9+ldOS/sWQhg7BPo5var2V4gbg+f+Mj45
	UrCNf0cqodaWK1i94trDh3jCC8IjOrrdgTDPv7u1eNLVAlYfMMEuURxHrWzazNM01KrKihHv4VNpI
	qTXGdyGzvAC0b9hIgnYgFEuVZgb/MGPKjSk4729t2wrcXgfqhJuHSQsjlCt992HbUgf6/GZdycnM3
	F0lfsg3PeGgnX05RVbZB0QVim/Ct+iPVZSTeWs7NOAj4LBIyOWTqyqY16L9T1he6Ip8nVR1WokQPi
	iTsTEjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifI-00000007PVz-0Sb6;
	Sun, 18 May 2025 18:23:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifE-00000007PUx-2zw3
	for ath12k@lists.infradead.org;
	Sun, 18 May 2025 18:23:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IIMxPO004036;
	Sun, 18 May 2025 18:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YL8DBcm48fjZT4qgabvudsfE3bZaf+cmnGd/EUz4ouc=; b=aj6cDDWMT3Y+2rgC
	tlK4kKlYxBHWiytTMfyWiEUJUl8+6cFTqcYCg5lNQVugHZTyWSBu5QXIcgSunCAj
	jdMyYfR4z8ZQzFEDUPg/PjQkNeIhUn9yEsi+VWbvVBPWRhFq/BwI53Whq1lWF2EN
	wXwKwOAhc6VVEHwdKLdy2UX3M5pHd1xdDjQGdvAIC7ff/XaCitvK6kTg7PegwuGb
	Ux/MB9ZTjpqtruoOI/vxrhlSSmvXDYlKAgFChMqsD3x4zZUt2A/7LmXEnKoOjA+C
	dtwIsM80jUa5lsKlNsa66anxmCrmAgkKSIdLQ7eYB4ctmJ9MlQka1HErjSohH2qS
	c2qWYQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7a9ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:22:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54IIMwhU005293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:22:58 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 May 2025 11:22:55 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Date: Sun, 18 May 2025 23:52:28 +0530
Subject: [PATCH ath-next v2 1/5] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250518-ath12k-ipq5424-v2-1-ef81b833dc97@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
In-Reply-To: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Raj Kumar
 Bhagat" <quic_rajkbhag@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682a2583 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=HmtOZnpMNtbFe9RdH4EA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QPMtm3cXt3JjQzzT9hYE1Zb3Hj5DBlBI
X-Proofpoint-GUID: QPMtm3cXt3JjQzzT9hYE1Zb3Hj5DBlBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDE3OSBTYWx0ZWRfX4bE2Fp/WEMzW
 H6ZoOmHm4Xqh7TNil/1ZC2iqMAiZsU7/lMumwhukqLw9W1TJ5aAbkD5pPX5btst/PM0uA4lBGbO
 wCSxaVDqa5EG23jHYzx09mfT2iB2/ABVsEB+nSRGvr9u7kc5ZXf7CyVQygWFZ7YMsL6vaXXU7wb
 CndE+NkDzOd+ea4+2Q1gogcy2GchH3ljomHwoX705V5L5TYXD2mk9e3o0phGMUYcodVVRArMEFv
 13CZCK+Joj8WVtOfgVT6uidi2BwqBzz9nDNUSoLW+UqQ08xsb3gFupaXMR3X6WxqWbz8e7HV3x+
 KVHA4ZS1PnNcoGrjSVTLxQihJvF/7pKNQjUnasrufZrdzpjWUuQuAK+EaJhkEz/wVXvlHnrjqwC
 LUSQH05pfdgO61l75VbEGTOXwlWWEBRqEbSQ1YCm34nT0xhUCRe62WLvejJIhcD0vPWutuUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=925 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_112308_877138_F40557CB 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad97c3dce72881ff552d238d08a2c12..37d8a0da778097b8bf7af2e8f1e920083a3fb81a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1


