Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A33CCA470
	for <ath12k@archiver.kernel.org>; Mon,  6 Oct 2025 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=; b=sQkvIBNEE1Chk0mZN8lRqK1oLl
	vITDxXLYHPlWBuLoeRYR+SV7P8AzShp3JiD5sGhb0tNxmba3NliqDBVNMYwklnjW58zYllg661STH
	3IgIDsvblbM76CsBLNXIWaSEbNkGfebzoRRIsh9DJO3Dja18POkT+xzfjb7f7F68dk0COjBumMI6R
	PeKfwQiwjzx/nf4qWqlE1z9EzntSJjjpqFAukJfECn2n7/5hLpEYXlk6mLE/E12EZ1TM8yzbpgoMQ
	6/D9cTNQyfEaUbsF2fKKdena56dFEsXio504qClA3qrBMAGqEq8P3TLvNOtFUfb5cYdIRxPVZMg6s
	itcL7kSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olL-00000000TjC-1u54;
	Mon, 06 Oct 2025 17:12:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olI-00000000TiC-0BE9
	for ath12k@lists.infradead.org;
	Mon, 06 Oct 2025 17:12:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596ETCGS017726
	for <ath12k@lists.infradead.org>; Mon, 6 Oct 2025 17:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6uX8yMRU+RN3y5an9EtPvm
	iOJ+b25K/dHy7f3R3KmZc=; b=HhfEKCM7fnl6+pfb6gMNDtWYFwhTCpKvfexTHX
	/6/ZpRxP+xywLmYoKsHZAntTl94M8R/tQ/KqOBR7AYO+TWq8SnCLaaQsy0NyEGFS
	c414gNyua2Iax/hlGlP+oMNv4HDkX+cmyQleuPE4jNILGSat6IjSVP2/f1J76GPj
	FXr6dVGZ9nqiS7XGZ6WDGrC38ga7DNRYgrXfQm8PG6ODhtuSxIcVQKJhXKbhqFxZ
	5mcG3aL6Acadq+TBYu+FJ5jmV+iwOlSKUHMr2aMlGHqqXKf6a1N44H6ntqer11Ht
	FR8AxXlURGLwjkqjeyw6ktLpbCFXCo8U/od+WUQnmV5Xuoiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1mhus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 06 Oct 2025 17:12:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5527f0d39bso6505643a12.2
        for <ath12k@lists.infradead.org>; Mon, 06 Oct 2025 10:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759770754; x=1760375554;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=;
        b=g96ruXs2EDWrQKGvdyg0DtJf3zQdFUzMgcwAMYtgk1JFdlmAYu1SwkodLHArKZyatx
         BNsRub97Pp3v87EOl6IelAP8adD4IWhJDgivwmokRM5h1+LgmqvesmyIPn7dACv1Kl6S
         MdTi1zVPKk3Tv23Nw/WT6K2XE/wly78m6n/d5QMx/pNB+CwnuKhbQX7unbg7Ec25jBHB
         DU28EQbHex7AI4xXXxRlbX0+w17fCf7Ojte9YmIhVttV7PN1mZE1uSMP1n42IIb14LMZ
         3yMANKu186tGn/0YvPDnmQRqI6Ip/AJJF/qPpRpx7LzPli+sFb5f6vYm+LuDGFkuDSL+
         OdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzaRG5UUkL+CthFaTYjZHxS7z52BmSDDPKgAd/fe7gZuIv5zf85BF/875DVBRjh3F6p+YgT1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYVbQ+UUlva5BpZbHzphBfdkKmiw0GgGo9Pzr+qu8z8glwO0WZ
	6S77GRW3vgxNPRQvvHZwG5GyJGTGwS4PHkFr5jwpu+gHEYd1Gn4XGDC5Rwf9P7NquzEykN+BGfT
	3Scnuu4doqsZcDHpq8YKqbGCIlWitBuhG9OrS4BD7RNMVVjqksUW5jNDPIcXwFOia+WiLmdqL
X-Gm-Gg: ASbGncteyr0J0bNu40/45XFGDDXfm6SgSEkAOF0JXBtJyBPtdSVH/eY4RTnsJASp5yo
	hYZzYTHUT8M4/nXj1d4l3LWyuznBu9GG6fANzW9mKmaCAoFMLf1gYtAFmGXtqtMnRw5QgMLyFse
	bRxlxyZ44nLiAGRcsH6EXkjrbQMzV4Y+hp5Qak1G+HwxphP8XF2H6GtpNet0XF8+by4Aeole3R+
	qQfg7C4YXkv5H4s0QMhys6+yVpAhqN9i1YRD88S85R34rIhNZlFK2AhVKLVMXtunDwuXKipayta
	7IWW5qrZFg4//APGWOFwBqJg0r8sJn1zFFeAiGkZ/vWk9GvXjcsJeK5GBUYegnofPr7ML2KoDYO
	rXkzHGQ==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494035637.6.1759770754474;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcFsQ5Cj8EuYVNyQn76xpACvpnbuvWlGVRXDAN6Io60+FOAQqunJFYDQCHg/w+DzTzrjT7CQ==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494007637.6.1759770754025;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609ba636c2sm12363691a12.16.2025.10.06.10.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 10:12:33 -0700 (PDT)
Message-ID: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20251006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ISofi_SlIhmEOopu5rQOI_vsFlOU7L-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX6pNmFcjZo2vQ
 tymIr6VIuPOa2mM5kONS9rNizobhxZvLFbRUQCLbLIgGuUeS7gqhAJ6XVn5f4acOx9MYJt8Lbik
 shGgk8nrvV4WuUZ+91KwUj4JXbqKQnPBBipWuAqrparvwbfug36qr4uWVamiEQc3rEod37OSJFD
 QlzjxkuIH9fVxmPyKh8T+g6IxV8FU8dmd4Q1oLmH9nl3vKoNiD6j366TyftZv5NwXPhaU15nBkO
 pzyWXZ/a2HfblQlsNtzBtD8csgjrNpHUJ+8Yp5D79iXNs0ypFUl6q+2wqCzHCNO3LNRg5mr5g7K
 zCymLh/fKzQd/AHZLYayl3YH2pBPG+MnFwIsBQ9BpWaKEtHPLNc3vk0F+mYDC74ohkFjygZ+VTn
 x9dpr1CvtH+6T29fk6GeILK/Gq8dDw==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e3f883 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=NTglem7-DTcMTCxUeT4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ISofi_SlIhmEOopu5rQOI_vsFlOU7L-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_101236_079056_DBAD7A89 
X-CRM114-Status: UNSURE (   8.38  )
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

The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:

  Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006

for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:

  wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)

----------------------------------------------------------------
ath.git update for v6.18-rc1

Fix memory leaks in both ath10k and ath12k.
Fix a sparse issue in ath11k.
Allow ath11k suspend/resume to work on more Lenovo laptops.

----------------------------------------------------------------
Karthik M (1):
      wifi: ath12k: free skb during idr cleanup callback

Loic Poulain (1):
      wifi: ath10k: Fix memory leak on unsupported WMI command

Mark Pearson (1):
      wifi: ath11k: Add missing platform IDs for quirk table

Rameshkumar Sundaram (1):
      wifi: ath11k: avoid bit operation on key flags

 drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
 drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
 drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
 4 files changed, 72 insertions(+), 27 deletions(-)

