Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA69C83F1B
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gd45mCk4hMAW/JBS7YvwcU/6NeP4SFwZAvzTIld14T0=; b=3qxWVFsddFB2FgWrvAWVNh6B1Q
	hUSdCR5kAz5+QZAf4cm2SDLaNezf3x0moQhbApmQ1CcqFU4WzbxTW1M0rxCGQIiMPogopHDVurTXQ
	DeCQcCdZyIs6fMJZzEl7gZjoQ4JXevSEiLr05vqyyuR7e2Jx1K8P3E6XXGNfdUztOrQ7wGbK7qlSk
	GwtuYinQr2B3TBfigF4K0VtiEZKBLFim3YAOwGfutO9/tvsKXqFTA6DlZ+Hu7HGhPGJSvMRoHYzmu
	jEKYeNEPpcsqPkOC114RTGRitb0XUlNq832pmx26FODn03bEstxKHNdYo+oNXQJMHI9RslAWL41rU
	OZLbkARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIPP-00000009K1O-1Gu1;
	Thu, 17 Jul 2025 06:47:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucINC-00000009Jns-2LC0
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 06:45:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H448VX020649;
	Thu, 17 Jul 2025 06:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Gd45mCk4hMAW/JBS7YvwcU/6NeP4SFwZAvz
	TIld14T0=; b=TuNSb1TPaNIvJWSERUCj3QCNo5DrIQT3V+GUs4t4cS6Qq+e1eM9
	uNi8l1rz9GEh3J/QiVHAjSXgXjNHO7o2Vgjy13X1Y2KhR0evRSPlKD7wtjA5jNcc
	iS0r/xceW9mQQApnwiN22xzda67xjjFMI4NophjB7Kc0xGHgxSwYlUjOmxmXyX+8
	30MIC5XsmCEz1iLIRFJ3Gj3VW0lSRtBw3jhuwdxhU2SqLSLk4bLwwC1A1Xr6jhvd
	ahxHa6loR1nn9hGZQlBnJrcdZQ+Vt6JmPeS7kM3pvYAAy3MvHOXDFA7LZ6joLjir
	aVJIuRQUwGG9gIajD1Q7d1ieqhbi4yAqXPw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dphk6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:45:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56H6jb07010445;
	Thu, 17 Jul 2025 06:45:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47xuvs03jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:45:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56H6jaC0010440;
	Thu, 17 Jul 2025 06:45:36 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56H6jakN010438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:45:36 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id 67B03411A5; Thu, 17 Jul 2025 12:15:35 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Extend support to parse wmi service bit 
Date: Thu, 17 Jul 2025 12:15:25 +0530
Message-Id: <20250717064527.1829660-1-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NyBTYWx0ZWRfX7jw0XHWE1cOP
 EDdt60qxmJtYlabABpuJs1qZjPm9mtUnJ8dSJR0L3jXLy+c39KmtQTvI/7F+tVSIdLQRuLnULfx
 NUhykmR/F27xkEzUt/DoMZQd+cNQjR7kWGOB3/RrbC1XaWwih/V5kLzKh2axzu7d0ajIgrKNhIg
 gLvVf0kLjcJX0coHrcBx65AjhpNkqYfTIzaqk2ejxeeVQloKaEQbcq6ccELt6otzL4P+taGUmvG
 cHwRS79VN3pXFFwjV+oYot7yXLbaL4dX8KxuEIqjBRVT5BhnwFZ6dhGapH6OrKExVbn7iQlmR43
 pd/P3pm6adyj66kAC75R2kcL3r29G/+f4Lsf4LrpqcEA6scDA+Knj4j9dmS7adfrko8i+m8yyBI
 TVMxJbPypfCA/93FG3CKQnVMfQRP7zZbqH56ASnbIxnzDLrHklUF79290K2obvVzqNRVle2T
X-Proofpoint-GUID: AiYdhNRfsR485x-2l1Y9qqeO2lArxUjX
X-Proofpoint-ORIG-GUID: AiYdhNRfsR485x-2l1Y9qqeO2lArxUjX
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68789c14 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VqKXJ2bPb1k_lhZ8nysA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_234542_598789_BC06CF6B 
X-CRM114-Status: UNSURE (   6.15  )
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

Extend support to parse wmi service bit till the last value firmware
is advertising and use endian conversion while accessing the wmi_ext2_service_bitmap
value in ath12k_wmi_tlv_services_parser().

Tamizh Chelvam Raja (2):
  wifi: ath12k: Use __le32_to_cpu() conversion while parsing wmi service
    bit
  wifi: ath12k: Add support to parse max ext2 wmi service bit

 drivers/net/wireless/ath/ath12k/wmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)


base-commit: 65c12b104cb942d588a1a093acc4537fb3d3b129
-- 
2.34.1


