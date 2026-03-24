Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A03F54ABC
	for <ath12k@archiver.kernel.org>; Tue, 24 Mar 2026 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=; b=YoPNhv7BosTAy8dcpeohG+cIOZ
	2Uy6D58Y8+dUVutrxDRvGtgH/diawoSBimxydLhfLp3stwBdF3peiIe/gOWvJ3ozcl7u/U5ihkuHv
	TvDT0BqlyNJv5jJTFegJwKEDMFWK/SuWTNfbzjpZbM/tbnpDsfrxL9E5iueOJiDwFxoWL5ekGmx8V
	ootTN7axrdNmYGSyzvAuOjsFItygEBxPLV+BAtOjfsYGWXiAUT5KFPG/+nvdQKuLd5EzhxAgQKmgS
	Kqy/mcc5BmbYL1qNU1YB/ZArdzpdZb5VEMGleOu3Nd0/IHYC1kzxB4jllST6Taa2aDp+m3IK/qEzV
	PAaAm6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b8-00000001cjt-05Zt;
	Tue, 24 Mar 2026 14:19:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b4-00000001chj-0gJu
	for ath12k@lists.infradead.org;
	Tue, 24 Mar 2026 14:19:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wUrA3039669
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AFEWlTNSgwy2TspeiD1fvF
	mTtd2MiDsPAba4aSIeMGo=; b=ivg/mWnZ400T0g6ggTpY1VKzyWpyN1gi43+q7t
	Fe5Zkb9eT7uOCj9YDH+/dVwrE4YVL53hCq11dKbL7coYWqtiQVcV6NzH4s64L6T2
	6Y5TTprvUz3EHJa24vb5yVw0gZRLy0nFWrbpzEWYbHZIWiXS2qMPUlUMWBecEHa1
	T6UCWTTejkBXHaQ3xD3xfJhA1QcxUHnb5GcYIb3n47Bh53T09/wbZHe1CBOAqIT1
	lfNaxLH5ZpS8XBpob/JnBs3tN6pPNrexokzt9LG/Uil1px8Kmopbl6DG7U9ecB5w
	Aln9Jwf60+yJMZ2FEgzOHwLFdAn6xwTSPeANDEgMq43WJUpA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gy2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c1596fabb6so3988590eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774361944; x=1774966744; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=hNYgrBAgQQrezrQLYJW2gOCFa7VWRd6BOdr4phQ2vzLYelgiLrPwVcaKa4rlK2ZAhM
         zivvSlme84Es+hB5CgPd/CDUESnS8i2JkKUFbQGWznjIKY0Aefw0UPYKzLuikr1tg5Q0
         cwws3TkPo3Pq6bnPAaIZXs/Okd2Gm4vUzsU2vqUFApTqOHZCCgSLND4IA+S7F20lcSsA
         EH6u4zlvVcZjeL/16nbh/gBvOEirx0oUyq3dfIewYwoE0dVqSmP1EXYMBXk469LOhb2C
         5t18wLRqhtLCrjBZnw1IM9ZLbmb8pwJSIre4QuGsC9tVSsVWO5lg5v8uOiDcTt3QaVQG
         FhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361944; x=1774966744;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=GFwpudJN7gzONNoTErw1wH13irXc1RqnsOFppoJfpETbebVvf94Fi1AWOTbCJVjUvc
         cNC4j1WJjy3NUExYHU0XdAGzsVyu7TszqsC/ZHqMOU8i88IsjQFPnDph3Hrr7x41SIZf
         8+lOM4g3KZcTp37oMlU+97DhRau45Fupb07zbFvcL6X56mZ0Y4Zs4JNjW/PedmZHBOA3
         QRwoIXgMsQYUV0RGRhocw3yem0kmdXlOEkMWhhufDS4DbbM5Qkr/bA+mx2/+Dhi28QRf
         QUMzo6UJet4rLM5XcNel3qHFGcBTTl5dvuMoLkQdX+0oX/dbcoxAQnsqiz2O29icmfnO
         TNZw==
X-Forwarded-Encrypted: i=1; AJvYcCVqiO7qdQtMk7ulGKl8bu6ePomzdfM4RH1avbRZJdGBSxkixsW99XJb2ghOyq6l9NFATRwDyA0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8J5bxobOJ6y73wphj49WNWzIBwNB6pbede169+Rwnhe9ga+Wa
	tC3aVdOoaCq9CY6ixspIGQGj7E03XhJa+QUkMFjEuzKvBIzIhrCmGwslzw/6vvdoqanxLqdl7z5
	fvwBBKjUig1Y7yiwmqZllNRCQ1VndT43CY2uPZzwYbGdqUQzBBSDcWjlMZ1gjKrCz
X-Gm-Gg: ATEYQzxOtPgxRvYePj73fIM5TptVMIpZf1lQpP4wGsHg9Yfh64gDWZ+E2ZrC1Caf0B7
	UXMOi5gVGCSv3IsQeyev9ppwfEsI3jTfX1nVCM0Jy3E3W4PkPqNy5kHNnHqCRFE0fABHI934x8N
	UKi996GWyl/dQJXjkpGEoIATM9Z8QQhhEu7tFOlyiCB7BU7sga6Ti8PMBldUo0S7JsIkzmjHKQ2
	rHp3mJbsMaucVYV/2HmbndZbDvoM06ZCDL9G4ePZXJHth+fn4gocO3PzD4lChWX+P8b5qtqXDYh
	y/Py7gKF3O1PkJFE0LtmHUjr5gvU6TKw601JY2jzXY9uDRQt7mjElIGR2FGWPyzddO3OFtoy4kF
	pBkG2O/TsdDfW9C+bFoIxAIpb6wxV63R+df9w8YUDFbreTbldEnzcofSLAw==
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850341eec.26.1774361944029;
        Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850313eec.26.1774361943372;
        Tue, 24 Mar 2026 07:19:03 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm6899720eec.14.2026.03.24.07.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:19:02 -0700 (PDT)
Message-ID: <1d9e6d43-6014-43c0-bf47-843ef08738b4@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 07:19:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260324
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMyBTYWx0ZWRfXybIC1QPjk4ow
 37RqKXkMkuvBESYE3E0ORUSqpVcdyg4AxyCJdjgbYwP76Ed9FdmWkEf9E2DUFzOvVkvjoeH7d97
 bdXZpxhC4GVl0EuWdLHlFXzGMDJcK1Oc98YbQj3sPjfve88iTwNDVq6RCBmhL2dTZqYYUBkoLsy
 uHcYW8evpNi4K9p1B09Uw7h85EbyBq+uilcSHZTqAsH/D0AlvBaQAwvTtQhF14DyCQMUnkhk7OB
 KEVOWMYL7OymWczCzvqPJ2SR6bBt4VF7zZ1CJd3H0IJJUdg4hlDtxKMh8UQr07nUOMH86lwcziW
 s8Bx6Ja7e+Mezc3mxiw+sKlmiGl9HAT1eSVR8emBaS37eumPzD6SoaDwfI2Av2iruC1ej0Jadtr
 gGZfczNyjz44bmxbw2ZYJh4pLaIXZtiwCz7/keNd2R7tyKhxVt2rntD+9dZxtAZi3QTzLhXpIuo
 3gPHk5DthbqRGO87YYg==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c29d59 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=3k6IHe8u8opv2P9pMhQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: XjzJuF5tyJ3yfsVljc0QOcNmCN5Y4Fls
X-Proofpoint-GUID: XjzJuF5tyJ3yfsVljc0QOcNmCN5Y4Fls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071906_461992_4DC12EF5 
X-CRM114-Status: UNSURE (   8.21  )
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

The following changes since commit a1d9d8e833781c44ab688708804ce35f20f3cbbd:

  Merge tag 'net-7.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-03-19 11:25:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260324

for you to fetch changes up to 4242625f272974dd1947f73b10d884eab3b277cd:

  wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session (2026-03-24 06:44:00 -0700)

----------------------------------------------------------------
ath.git update for v7.0-rc6

For both ath11k and ath12k use the correct TID when stopping an AMPDU
session.

----------------------------------------------------------------
Reshma Immaculate Rajkumar (2):
      wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
      wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session

 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  4 +++-
 2 files changed, 10 insertions(+), 9 deletions(-)

