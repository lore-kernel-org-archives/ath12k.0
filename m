Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27FBC7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/FTgFQceHzcn7zExBhEXufyVW/RSqrJSAUW2RET5N6U=; b=BUQnFNmNVnJeya
	ir7fJWjFLmSC6yaDHfG5t7M/PtYzJ4P+8XEFbtp/aO6zSmWDHQt2kdnnPx97Fid+ZH6TFcPTRldWC
	iD/lomo8RzEiOYSQfETZH5KcrHl7FNQGDnjTYXMPujT+DS8D0LY19hvR1R51vZvq3j+0XhKjSumU7
	4eqAjE6olVO0Kb0rUXHWLOKYMNr7Lfs3meRu2AqWHiZ4kN6PQRnHgPimvKKCy+h7DQSoZ49tFDbJ5
	z+WVpd7lFH3iAEc/dmJqYrJLBPEpQP+3QWZTb7rEh/2FR0MT3Z7A75iZ5hMxztfnpStKmYDRDgOVI
	YqMW8PyymG1MXWtjd2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3X-00000003pON-21xh;
	Mon, 23 Jun 2025 19:42:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjQH-00000003J2T-3pUN
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 15:49:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NB2nId029925
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/FTgFQceHzcn7zExBhEXuf
	yVW/RSqrJSAUW2RET5N6U=; b=mAbcCwwtEl2BoT6Mzvs1Tce5Ddd/Nxtz/G8bl6
	3SJ1nsske2+PYv3q5X9MCuVJP70KoqV7OxQaUPZIhQTp6tFxhxpYMDAMQvDWZ9Ws
	gzexT58bMSLndUEcUNSyaRJyJVEguoluo/ldXHpr4PWtfJaKI28MCSs59vzAQZA1
	053VLQtFGUlhPU8TedZrxkRqjvp53IL8UcA/WjQjwV3YJhhco+ugnC2IocCbGAJO
	96HtsyBFlmNDdk89LJYDZb+JmbcLtZSdGUp+NeCWgVUHqoDtiPjPhZfcBUiOjCTj
	bh2SXDkktksHS3/Ixw/aURJkR9yKrGbAp5VjrdcIHj+xgn6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1ynb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:49:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237e6963f70so29829985ad.2
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 08:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693766; x=1751298566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FTgFQceHzcn7zExBhEXufyVW/RSqrJSAUW2RET5N6U=;
        b=QWS32G/0UJ0XL/XKcAruOIEw6Ss+dn0PBidjC4ZaYLhakjpr4CGBb55JrgdwqvKWWi
         34TLvb5/hPoaqveaxrTRLKtbNauQ03wUOBIIw9DhxP1PLXiEbiswaQ4NCz8Ob2tRtay5
         q6aPB1xUd4bsp570cpRNdsexxI3gabEDcJgutz84Y8Pfbxr0XVHHgC1vpEdeOWfznJe6
         zaOjAtTG/YnjJIjb9/HzT/i5t6sclCa0VO0vH2/4a44LRNInBLt/cX5BXBT3XxEZcgp6
         daTFea8MVhsRB/k3Z9wwCPTnXPXiSLGXk23+RkLyrEwoEdzfiBRN3rOLVfnxA6U+Lec+
         5PMw==
X-Forwarded-Encrypted: i=1; AJvYcCUPq94gCRYXTCpM3zq6QcixC2+StAnhTVslHLrDT7cXeL4BSHBBqBx/PGKbVeqpAG3+2kedsfs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCmF3WFLDfwH4UlFhkHKHSHuE1xGU2x6iaaLeV/2W58huvQlQg
	3OzNYy1qgt5Kvxoq2prkPoG3mQVSF4MzVzyebNEi3JXOsKzbQ5Iu+/p21LUfX1ikt8VbfJpPcYo
	vdpyn5D7EX9IC3TH9q/qNDjQZcMR+/gcDPvlgKM2aOhFQ1wuJXaRsuJiu+966FVHj
X-Gm-Gg: ASbGncvuvpHHcfbxbf4+vUO77cffMNH7GQOUGxU/mNH7TrDoF5ZMMb7ekGOllqerQgQ
	C4cw4rlwg2cNQkVsJgMa4Ki/I67WIypxtFj3OoJjKMQ8hu4OrIQZ6Apaks769KTKro8ESynEaUT
	ihI76S648R8qUJf1AwsStevV2qQxCmUYtubNAk09mPIt5u+hJL3t/QfB4tebAZLVjGeb34yCy57
	2F0JHWiSdMBfloXV6Y2HkHe6OP+l+4HdWFNjvOf1A7whbv7jgO9dzRBS8Mr490ZoVtAZgMj9B13
	EbhYrWW+XrgBM+JoQE4gC0ZBhshsSYZ5lND55ad525NW/Ya21uIwiL8wZ46YOGZXVu4WbkeBxzi
	Xmw/M3iuEh2dRkAu14b553EZHFTm4T7PMI8ntxpgMoUNAt1Y=
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr197474975ad.11.1750693766004;
        Mon, 23 Jun 2025 08:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFU3ABXiRqt3xUYh9w8TVC9FxESy/q0q0aSkLDt7c0OY6Y6oqyIh13ZrozUzjpmduHLQDZTg==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr197474645ad.11.1750693765598;
        Mon, 23 Jun 2025 08:49:25 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83f14a2sm88447095ad.80.2025.06.23.08.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:49:25 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor value
Date: Mon, 23 Jun 2025 21:19:08 +0530
Message-Id: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHR3WWgC/3WNQQqDMBREryJ/3UhMGrVd9R5FJGqsAc23+VEs4
 t0b7Lqbgccwb3Yg460huCc7eLNasugiiEsC7aDdyzDbRQbBheIqk4yWeUYfam/0WDu0ZOp+RPR
 McHUr85vM205CnM/e9HY71U/QYWDObAGq2AyWAvrP+blmZ//Ti/K/fs0YZ/yqeNF0smmL/IFE6
 XvRY4vTlMaA6jiOLzdlUtTRAAAA
X-Change-ID: 20250513-support_real_noise_floor-205986936cd3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68597787 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oo-PE9G31wNHbytkz5MA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MIdkwWLBV_YZuy2SfFoiN5U4d-d1ov4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NSBTYWx0ZWRfXw/to4+I2SBqy
 tAEamuBpYAd+ODP414w0anHLpPTcCv419mm0kBco7Vbn5LNsgvgDCe/SWHBo0GeARWNov8U0FXR
 kI+2TaZCX7Q9iGX7Fcn+1QHP1GVTmqi2TbnHbO0ckC2gNzdQnzKI9MA5CvWed2aJ5mGkuGAKUSM
 uiF5y3pmgRWxw01QIMwE8eRJrjBzUI6AJMyxr+ILwJwfO159fmEvRj7PeXWKG7OyrpEFokkyvFx
 Vz7H4lUxVPiFf1NlKl2TMqb3YxnQHw2nSixQ2RF9F3IwKpgbOkvdYk9gqkgu9DK34HQ5wHS7KH1
 aKVq3QNF+EE/3Psh4WftcggmyRY9dgF/b7Xejbi4SFm9WRviWfYGblvFZPow7CJQWMp8CDtVEcY
 JKiZjuJNWXh6x1yuGYt4TvWbN31UNK64SUBe6mgOnW2rQmhED29mI9U4kzjufxOZmfdyd/kh
X-Proofpoint-GUID: MIdkwWLBV_YZuy2SfFoiN5U4d-d1ov4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_084930_090668_3457299B 
X-CRM114-Status: GOOD (  12.08  )
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

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value and use at the required places.

---
Changes in v2:
- Rebased to latest main. Simple conflict was only in wmi.h. No other changes.
- Link to v1: https://lore.kernel.org/r/20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com

---
Raj Kumar Bhagat (2):
      wifi: ath12k: handle WMI event for real noise floor calculation
      wifi: ath12k: use real noise floor instead of default value

 drivers/net/wireless/ath/ath12k/core.h   |  17 +++
 drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
 drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
 drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
 6 files changed, 324 insertions(+), 9 deletions(-)
---
base-commit: e9efdcce074c55be396ca45add336121549bdcbc
change-id: 20250513-support_real_noise_floor-205986936cd3


