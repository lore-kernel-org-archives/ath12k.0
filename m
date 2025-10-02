Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2092CCD182
	for <ath12k@archiver.kernel.org>; Thu,  2 Oct 2025 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5e+o/eBl44A4s9g8vibFtNnQb3h12wCSa+YcF4aHM5g=; b=29pMB67Jo1GcwMW+H7VxChG3R9
	dZ3bjMRCSzzzY9ei9WNuDq3BZeprpfrMzsbHeCSa3TiY5FXGkx0Yt4nFmUjyURx2fsTknQHvGzrnJ
	/64dQmb3IY1HhwFNCNK6YBINcJ9B75PjiVpfxgN3P0Jb+A0ZnlRRZ5Cwu51j9nQiyu4lzkbewI5P0
	XhnJTJ4laswoPeFRhWuZD/wmsy1JZWfMh4DMOn0qg2cJVFlFiXx1KfrMmb1xu3456ItTU+XnPKffo
	YNsUAs0ibDORKotLTgW98Q+5MmOJw4lGymZoCrwMxZr8twdTo2u3iEMZerog9e779Xo0dJTKfWTAi
	4Ylqqs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46rN-00000009HLk-1oH1;
	Thu, 02 Oct 2025 00:07:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46rK-00000009HKM-1i1B
	for ath12k@lists.infradead.org;
	Thu, 02 Oct 2025 00:07:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcSXo024130;
	Thu, 2 Oct 2025 00:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5e+o/eBl44A4s9g8vibFtN
	nQb3h12wCSa+YcF4aHM5g=; b=ptR/eFRHpooi4NduGz9mQM5ETrFtX/26PAbjYI
	lxcAsslJBx5+V7whQ4fcEgxKMlOiaan0Z/JpZPvTqUuHDs1rqWjhbnUnSvHzd0ki
	dNniRMXW/UkSQClBeL0o9gRyn8dtE8hK7ywO5A9XHRBqa8d8uqfnb/91FPpMEzAD
	Zx+JXHxqMac1gW/CjftGYmFDWuG6ZjX+NYQ+UbCNaR3k47sXHyOiRe6XCZ7kR9uR
	emyI+Y6aW3NcdZfDXj7q3e15PtkJmVeRfPFtuEYLxsU2fc5RrnqEJcPJLUzJS2IT
	XBDGMNH4gBrrsZm3Qa8/mtYJATZVPkawLYOpam/Ek1iB/5Eg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6680h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 00:07:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59207hum013963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Oct 2025 00:07:43 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 1 Oct 2025 17:07:42 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next V16 0/2] wifi: ath12k: fix TX and RX MCS configurations in VHT and HE modes
Date: Wed, 1 Oct 2025 17:07:30 -0700
Message-ID: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68ddc250 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=HofUMcyOe6VF9sWmV4wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BZBLnaS4xnQs6lGmogGLnXoFUXhauMZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX7srpFTEQp2U0
 4tyQrocwXbzXgJdAoLTOlcvHb9qML0//Je7cZVQrkvGRRiB26Kb7LGTNTbQtVYPIE3ydjFTPKfG
 7ImpkKGBgoBewSbvLh3A1BS9jMndkbJ0LjaWtbY3tWLDtjm9efJx0jx0heMsLX+9yCN6//Dasbc
 ERTPQ24pwQFpPL7OUzGXIahB+jG8xoIKsbYQjxf5oV0rdbXaJ4F7M3+cZUa5PV1ddyOOkyoHfej
 g3kjkcbMmXQo56HQGUDXD1JqvJ43UTEo5liUd8h503hLU9a4UYCZzocCxqqe15utnToyQvkHjKO
 7ZHz40bqQlJHV/fo+WERsfHvvn+VY7JbDXeaKmvOsgfbMoZIr3AiPvGxA9x9at53NnEp/ExAalO
 dp/8OWYWooY5YOWzw8SYB7sX5Sd/8A==
X-Proofpoint-ORIG-GUID: BZBLnaS4xnQs6lGmogGLnXoFUXhauMZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_170746_571773_5AE6D190 
X-CRM114-Status: UNSURE (   8.40  )
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

This is revision version for patch:
https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/

changes in v16:
 - remove patches in series which hare accepted already
   https://patchwork.kernel.org/project/linux-wireless/list/?series=977538&state=*
 - Fix review comment on last revision https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
 - Add similar VHT related changes into separate patch.

Baochen Qiang (1):
  wifi: ath12k: fix VHT MCS assignment

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: fix TX and RX MCS rate configurations in HE mode

 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++----
 drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
 3 files changed, 14 insertions(+), 11 deletions(-)


base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
-- 
2.43.0


