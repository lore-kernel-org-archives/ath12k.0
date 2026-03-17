Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB79FD7091
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=; b=wpIWFEFenT59jPvfL04uK3KCuz
	SPmO8OqX+i66OJIZLOzXypoo7Yq6oAL7p0x3uNQUx6ScVrSfVxf8y1Voc2Ali2fjvCNTboZVHbmQw
	yY2JorjEnVINX5X1OyUOV8LQBeM0tIPKwS+JgqsbgNrtyU5wNt4F11NHnSz222RM78pF639rl+QFT
	YA8S/OePclVdDQ9jfjanY1Fbi37wh9AcbdILdSOvpzj7QY/pEkEGUBZfWsazY64mN44x4IkSRdJZ9
	1aVWO/JvviZ5ueOQIh13xUwf2P+n+CjashUy2Pt0D3otFnoEIQBv9bv1OPUlXlL80B06DKyhTQzRo
	OzEfx90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asc-00000007BiS-2u9O;
	Tue, 17 Mar 2026 20:19:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asZ-00000007Bgy-1lwq
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 20:19:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJd3O161202
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h8hJpBSymWCOuiDE63BWom
	IOUCJqxU/ANvolJAkwQik=; b=EdJCwjRks+tHuwFj0x7YLeaFL6s704BL1NLgXi
	+zK2X75joPTXfmrSjaOwuTBQWpxBlapLQePhZqqRSRQV9olta15fMpxCzmi7s1Bi
	dbGJbbDP2RHQMbgmFRaatm3ruLLoW/Qtsjn7OGSAgKW5AbP++sLyvOfNpQ3jvrQH
	qGwp9s+cv6a62MjGuO/I+hCvY+lDg4pS2NSQR2OSK/OkTO0GuU1Jd+YcIfShqZX5
	t/ZVOr012PQVgQuqFUR+gN7fjdT+mcBAbqTFDWgjUeqI94PPJXcEpOmHRGFRzm7z
	zyfCv3tY/pfncaikXWIQAWWMmQ8NUN6V/d6TMKHmaxAoVI8g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxjvuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bea1ffd05bso5876729eec.0
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773778741; x=1774383541; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=RN1X77MlE6azZ3fZbKN5uh24aL7Z92xc1lrVhfoRjUd7r/XZRauDIZU5Y6ZQMCMghg
         wRePy0kEtaqPpLy6cjxFskkJAKg4IQ6mAFIbKq0er5qbjTirOZXcMcOBuhIB08EoDg9X
         rPxbOB/aFWf9MZSr/F5kJhnPuV8/+IS+bXHabWDj+3RDEDrQwEzja5DuI+8x0IlFOWR2
         JYxrQafOl7rsP+cqpLpkVDOkMlIR5ihlgKGPoZi1pEBd+vL1/FLvPywbrwxGVHIZxsBt
         icyD+iZU2Fy3bOhfZFRGaXXAad++pZbV5kfX5wb6SAnpIOKteplKT3F2vJz8wdNSsqW3
         53eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778741; x=1774383541;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=C3MtrNwUUIeAeuCB44Wsf1+p9cTyp5T959AVzlQEejAo5hqwKcEA5E7IrElpNkVWfQ
         YjIClv3RRDNAClSzg7bwpapJ9yGuMxff+qKD3INsUMPKoAY2DS6BLBw5x9apxdxkyRPb
         EaVRYtRiFQ6lWKgEfzcuvq0e2sMrJMq37Xf0aoBUDOZOIIMc1OiGEgPbEY1Zg5iLEK7D
         ZzpoxljnF1VL7CIZkPm4LU4NpwJVYKn9i9EQqsQFczIWQJk1v9lyLbRN5nQzOXX2nQyH
         R6K3cBSrtz6mtdZYq5YXJqf/R8Ioa6Ube86oTkL3yTtJcGe621+ODsLMn1K3wvb9u99r
         jbcw==
X-Forwarded-Encrypted: i=1; AJvYcCWY/mV1RG5hHfUfOCC4qefORZSpUHsmrVV2/qo3MQY8TPpAKHvtT3F7L9v5qp7phpnZXEhiiJI=@lists.infradead.org
X-Gm-Message-State: AOJu0YziEkzE0db9qptJMZuCqtM/8k0EEEeinYCG59pTTCm4LHJ6fRsX
	zVgAkH0auy8iR+NuJp0Z9ZPdqWQeHcS4tGnSD0UfkX07WyLV1PV2yNtjeiTMeY0m4FAvTk/wRKo
	8tl71CfQvWv2YbCPPYq48rrX1Uk8VSlAxwZfh1L3o9y7BCzT9W1llynLPeV+K+ykA
X-Gm-Gg: ATEYQzyFJ1RemdoYIvsMAA0HpX7eHfEa+mJ28amRc6aNMJGV2SjFoHBfh0jxL1NcRP7
	fzClNh7192+TZw8l8/dVhQ6sO5EOgMf/nHjQRJrczZ0x3sOUWAJDEeWje8VIFkYr4ctbQHtSir5
	00qbftsjWQ6cpAP+K+lHH7+n4zjt59HHpHryELjp/FGcDqdQ8tRbu5XAB2lbv9zY84pXNgKTRSG
	segfRBWBdrvkmNd7R2WSzyDF/sotqa1zC42CvsVRbIpGZD3h2Z+y2Y3H9OKAqbvvQSLswX5wapM
	gP1QfzReRbp30OGE8kQRnYjv8yDs5dN4Ta2BSN2JPDqxBru8lsSvjQqsXCSnvg5tt0WLildmIU1
	FNMYIM1/0Gc6TWlx63m4naT344PtyC9tdx3JFSaE12AlExUqv/CUfz+OYNg==
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393496eec.10.1773778741137;
        Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393474eec.10.1773778740510;
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm756534eec.30.2026.03.17.13.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Message-ID: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260317
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mulkpiENqQM14hHuhw7QlcOGDiPgBDQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfX+PmjvdXfqeZ8
 JU/b9kzWaM8FCkIUKFVNvmSDMpMplHAIVInoSKCzgMLC1xGJoqpDzmIh3dAmmuBP5z7WZ87gekJ
 OXmn75EdfN3dB8sb1zeLPc20kf/SmXnHTOETlvyR5+ap6vowiOjx3M3WmopT5xGnPYtwih4SNFO
 iidrkPfQD29uYRr0j4eirVOgvEqHPpX9EAWN6n1gN3sThpv+NDQ4+6rksOxu9SeF1Lfryp41lYV
 2DNJ7oNSwPr+6djNik9i311xd8/nkpSOVHAmDEBMD4NDudikEguK3Sv1qcKnO1qGbVJaYN3pH0T
 TR5YkXSFqBBdt4KpjQx/Flyi+B8AxKWtvzGpOhtSx3DScW8ZYnHxT3BnAVgCGv+rrUAAwLK1uLt
 LwHjd4ciGrfj2GtzbAwxsGsqd4vVVsgSkxQkpus0blm12NNuoKNtyLWeiBf5BeK+YbY8kjKmVRL
 ceTRyEU5/wCUKqwTPtA==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b9b735 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=lm4jLvrnElEPTkshbfUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: mulkpiENqQM14hHuhw7QlcOGDiPgBDQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_131903_491201_522897E2 
X-CRM114-Status: GOOD (  10.22  )
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

The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:

  Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317

for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath11k

For ath12k:
Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
and Automotive.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
 ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)

