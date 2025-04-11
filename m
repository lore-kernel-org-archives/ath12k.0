Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32008C3601E
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mboBzHvL8vMUQ8EmJb+LNYDAPWvdwe5urX2ZvSDTBmI=; b=3E6PSs3Q96tlcU
	f4eKumptlIdFGa3gs4pymIQ+FW5VUhVhKM3GzGTYIjENm0X25/u9qT6AH7EQUOw4cF2NFA8hV0ifs
	U6vRTyl410a/W5idvjzM8Dpf89LvXtZqqYEDcTj8j2MokrBpYDn1TfdB3Z12W5tAkPXu9tzB9iMVj
	HN7WY9pfSjbDGowwMTR56G6XtI1YorzYgMK16u3bbKwqcusSZ4PschBTVX5e5GHUiB3JFBCbOj8s7
	6vscY49Ei52zgE5Rj9F0sjAySYLWQH/cLiSafl9MEZvnKsOo02hrYGw6oQWk2L7DUfszEoDKpTDQE
	Z12IJb2iWfe8iHIqdRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tD-0000000CNYE-41zw
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:17:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tB-0000000CNXl-29EH
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:17:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGVtca032024
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mboBzHvL8vMUQ8EmJb+LNY
	DAPWvdwe5urX2ZvSDTBmI=; b=dmo5rb2QpGODtRuzATbuJY82hOmaJHZHWtqlRe
	JkeTrk9HsXKcB8M3UHGSsY7cphUrEnjr2KJ95M5oNr5gNmjsZH343PxULDFFas47
	+YlYMTCH4pkqdxhWoiCGMXtberqilSODZ2YPRGmJi0/0gwIwQEEMHjb1E2sxevNg
	97o1iUCuG6z0PxoNkeW3dC+d257HM6ZzpS44FC/bNu3teaCOPkJZl2YPmnizITT2
	K7rrkeIGRYPfu4WJq2EO+fg7KnGid3iJZ0jLfTFuhCoz6r+huhr0znqciD3Wiww4
	cWBXzugEh261d+38g++3puDcp8McsqXIZowe5THaJOPI3VnQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmgwt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso1780796b3a.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341428; x=1744946228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mboBzHvL8vMUQ8EmJb+LNYDAPWvdwe5urX2ZvSDTBmI=;
        b=Q20dU/RrcqjqAy4wlpT55sA2FnzEB55AMDUuRlykckg7Zl/e0KJfT7eaZoZUJBEZFi
         5YpDpuRfsWNI/i6eUg7FuoTdrL0xcTDV3JI9OT8IenCxSUacn40i1ALXxPPOSZbTMPJn
         OnM3l4dNBVCe84mNCAjfY8BGhpQX29rdLak67+BVvT5fEyJbfKYSTm6pLRvXrffHAcAQ
         qcXNE2zKiN+2ye8rBcsKvYc/CKqhxQzOtCJi8EnmtTu21+O9U/X97A5B3wbQvS5f9dID
         vCwnRjpX7irbdNHESDxzobXsqTo8rHGs9FqjlvTRwOy6puIbWQhhLgqapwZYyKj/t1/c
         0GtA==
X-Gm-Message-State: AOJu0YyLm2BPjtFkGAbVwaGjNeuei25t8SfZkvwRWNi2CBovLqbwd1dC
	s1pByPxvK+jWHxoQWVu1bJFARQXKILWzjhevr9TVvfPWWFk1uKyqfJPcuH0qcFkW+JR0+WgaGIU
	hYHGSkdnVk3N5T83Us+hbOfHKWB06TRNFuPQJ7FunoOD/gDVweX/MtH1rtRqj
X-Gm-Gg: ASbGncuQC6EVCVuYIrXobrBSXpdmepV0RNvYKN2Kugp9qXEIEzmgxmK9HNV3kdK32jE
	nPzKTor+AN6V/S4fHCKBFTl4cgGG2A+ad6LUJpoVgK6X6Qp/xejFacxsg6+qn8XSGxP/ZCC8P6I
	kVvuz4w/6OjfXl86u5zRMhvSElg8orG7eV7UbSaHG64E9UWTa5JbEUVGk2ECboD5fC9rFkkHaa7
	d7oAq59nlMQAdS/F53d15Ag5mnjeeN/CrtfYIec/6ejX2RAYybAqNk62yDXA38x+BE7loifZclS
	wGQQ0yoSNj+T6Z+G0RDSDTz3Ym+Iy6adgD0Il2vy+C4h2DdtJ0y7OLK4pbksAyRJ4FEtOfyl66d
	Sh9nTxK9NHBr5XE88E8Hv3gAt6Q9nnXtnyiaK
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr1522186b3a.10.1744341428054;
        Thu, 10 Apr 2025 20:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv+fKPnPgGK4Y7/uTWH4WTtAT5p4xK2gJKswdv0c71qBJjupR3Qap0nn0HR+oDeB4mvxZpyQ==
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr1522158b3a.10.1744341427613;
        Thu, 10 Apr 2025 20:17:07 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:07 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: handle scan vdev
 consistently
Date: Fri, 11 Apr 2025 08:46:50 +0530
Message-Id: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKJ+GcC/3XNwQrCMAwG4FeRnq20XUo3T76HyMjW6Ara6TrLR
 PbuhuHBg7sEfvLny1skGgIlsd+8xUA5pNBHDma7EW2H8UIyeM7CKGMVKCPPYapTi7HOnnLNFX8
 N8SLpbBsCa5oKKsHH94G4ucBHgWMnI02jOPGmC2nsh9fyMRfL/osXa3gupJKOSocOlC/RHvqUd
 o8nXtv+dtvxWOQMv5pb1YC1AhAJWvJW6RVN/2har2qaNeV82QBaryv/R5vn+QMUVkpIaQEAAA=
 =
X-Change-ID: 20250402-fix_scan_vdev_handling-ef5be452b949
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: WwP2AQ6woG1a4_XCKdy2vTVsUxOu6zp5
X-Proofpoint-ORIG-GUID: WwP2AQ6woG1a4_XCKdy2vTVsUxOu6zp5
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f889b5 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=HtmLlQNqzqJkp9_W5pEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=899 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_201709_558544_3E6F23D3 
X-CRM114-Status: UNSURE (   9.43  )
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

This series of patches addresses the handling of scan links in the ath12k
driver to improve consistency and functionality. The changes ensure that
link ID 15 is correctly used for scan operations across both ML and non-ML
interfaces. Additionally, the patches prevent scan failures by fetching
link_conf only when the link ID is valid and setting appropriate default
values for scan vdevs.

Currently, no issues have been observed; these changes are intended as a
cleanup and to ensure proper handling. For split-mac these changes are
pre-req change.

---
Changes in v2:
- CCed linux-wireless list as well.
- No other changes.

---
Aditya Kumar Singh (2):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations

 drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
change-id: 20250402-fix_scan_vdev_handling-ef5be452b949


