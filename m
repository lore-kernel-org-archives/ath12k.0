Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D8C79F9E
	for <ath12k@archiver.kernel.org>; Mon,  7 Sep 2026 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gz/5odQtl5IxrS0FqoMNcCHjOTbt/M+2esFXOAMAlW0=; b=i8+eImpiEVA0qAfvabDyptpYuZ
	0s/ezesSYtxX+8KRcoeNbPleTunJVp+cbz8hVwqiqohLOTbUPSvdZn5AE+18gB5xgmQuV5+MpAj2G
	gD+RHm2c16AH5v9SkmU82ykpAgK2sM2/ooou+KTYogBkykIA4MERHFjkwACGxieLM63bJem9mVS4E
	UlQAoJ4b+XhUUHwmAPHRY3FdL/INd78LVWsKi+5Kv9WBirO1/S4vo10dNlJxfGLrvK/l1xBBBYKL1
	TBTqSukoe5k02S016CdjroNXpQkN/JeKOKxGmO5fVt6yW+kY1z5X2ND9eR3ufPChaEsc+whEYfbJW
	cawd3oTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xrm-00000006iRX-1Wm9;
	Mon, 07 Sep 2026 11:50:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xrk-00000006iQy-014m
	for ath12k@lists.infradead.org;
	Mon, 07 Sep 2026 11:50:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amtxd3872836
	for <ath12k@lists.infradead.org>; Mon, 7 Sep 2026 11:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=gz/5odQtl5IxrS0FqoMNcCHjOTbt/M+2esFXOAMAlW0=; b=jk
	Qqniy5OhSfhvR4xiLyEbXswCzOYk2C7G/NflSvW8936geSf5xE1b8qwKikl6F8K1
	bY1QbyKnnYxJAbi41lN+aqpkNzZtKjPL+5y1vdlUlW69Lmz5vjdQpSohwu3jCPqn
	sHtamN8aMeqkGqMv2arLffbtAwGsrN1CcTUgvtSk5FUJP7oJ+0lMwLHAHE+VMlpN
	1XXPzSLYGA81e4g/nMhPFRO3zrmz/WY0KUKuMh/JD7M33OZ9CUCbuFP6d42+3mp9
	H6hFCHeP8631Rt6OqwmOyn7uiLBsuRzbNjLo3ixY8ep5IRI+PNee4wdL/xfumQQQ
	Gw32RjkX6aL3+Bi0FN6w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1ux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 11:50:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97bf875d5f8so2848812241.0
        for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781820; x=1789386620; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gz/5odQtl5IxrS0FqoMNcCHjOTbt/M+2esFXOAMAlW0=;
        b=VKgur1hosoZbKxC0O1NJYYKkCqL0smlRnj2HXNFnz5/vAF3LqBLhN0/SQA4/vkPu/W
         zCF2PPzGnJxifr/EDCR70lMgrTuZ1nXqHcXkRYnF48Glzc57jysvhj6XzLxWs8+CEzhU
         Ev9Rg1VGFCWGrmIru7nuopIKS8XzNup1cXfK0KnnKB6KYf0nhbtqw6QnCdH881RHnvjr
         2KdV01PhJMggl4oBqx5cMq9/7UbYOcv7ff2M4CJcSwsoO2KSgLQSJ22jcEkAWlnuni8k
         eb1goO9HsBgekMM0Sf3/adi81plrBaJ5I0mC7H/XduZ6vbwrO+utug3SK1N9IPB3W/tz
         NjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781820; x=1789386620;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gz/5odQtl5IxrS0FqoMNcCHjOTbt/M+2esFXOAMAlW0=;
        b=MPhrBlJFYkL0HiKm3XQYlALeOI6BMSIxgyHg+9U5SzURam4X6lE70zAGmvv5h7zwEW
         XoluuNLtFPz/B530R/8+ppFusJwb5TrKKJq5Skzsl0jsk9qMQ/jQBzTOauVLChhIodaJ
         MFofdBqenFfVURkKOH3jFO1kmFiiV9KShQL8Lp2llamk4vr4o6QNlmwDW19y3r9snouc
         46j6bFOT+m7Pcqemw8cVKzZpP8+5Wod7R4+jZgh3PdzmH5atGc6QTR3R7bEupmQaeWzc
         kIH+aQ3E4URLOmCkZRhm9N1YaTtO/eV8B8ok8z3MxvlQfXar9e2VyC419tOg170RP79l
         3ulw==
X-Gm-Message-State: AFuF++ks8IEODcMRafLjCTa1qLN0MG+Ar+CNzyV0ICC0UngugE5jLcji
	jbQqI5oCc8JeptTtoMVzUqMPA5/SCkkOerYdZZMR1/cFlZy5njHQl+5a5GKW+AsJgFpZGUN0h33
	k23N8YdZv9fCkNUdzer2K9eWfTUfGj8/kd5PmtrroxPmtdaqH3Ofwnya36lA45H+R0l/RC+TK
X-Gm-Gg: AYBFou1Zy3ji71+uF9VkoIJH1QxPL4HY6EvyAl67e/AePNvJVxXpKA/4+QbNQZVjHPg
	W5G+SSo16Kzyum+faIZrtSh6MInefwjAOraxQeJS2CyaiupGNDb/irICxn7X3QCogfnNYUg1/TC
	d7ZENVEB6x5qgaRNLlucxATiBa4OYvVhM11rSH7GaYLY9eiP30V6mUxsmlRmI/IlGfdsS7I0iW8
	/Zm3k0nUPeaNvRxxR9FKmYDmAgLHQXBniFcdcFWXB1rm4jdzojHycdO+P5Lb27vUJDf6OY7KI+8
	Y4reLsSPpqxFife4y4E4G5UBgZq4/SnLClLGU4yRkzCMlH1r24jSBkaw4cI/EURPeBSWR6GssnR
	GMyuzYyqe4+OGnk7+DmsR7jj86+fve0vh9W1dzL15Igp2QUO5n/9PezC3JVb9JE73kHm6Xq3OLt
	D+tJ0u6l5TxZRL
X-Received: by 2002:a05:6102:610c:20b0:786:22cc:cdda with SMTP id ada2fe7eead31-78a2ed80666mr5459761137.1.1788781819881;
        Mon, 07 Sep 2026 04:50:19 -0700 (PDT)
X-Received: by 2002:a05:6102:610c:20b0:786:22cc:cdda with SMTP id ada2fe7eead31-78a2ed80666mr5459746137.1.1788781819369;
        Mon, 07 Sep 2026 04:50:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b667b6c30fsm1934782e87.9.2026.09.07.04.50.18
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:50:18 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:50:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Subject: [hekatombe@gmail.com: ath12k: QCC2072 missing board data for ASUS
 UX3407NA and UX3607OA]
Message-ID: <r3tn3bnqvcf5zdigli3gvcb3jez4al64c2grtxso4hw476mguz@srktt5cek7nt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX9BjGvlYGwqbK
 5kdpMOVstezKccpmdPnsN4kzcIbiw+DmYIHmXFSESx5SpZWHxWOMhxdrjSJPdTD8zfIVzlL+SMt
 oNW3DjTR/EPsozyjncFRqAbWG+lHwCZA6FiMTjeg/GD7MSEsBeyjbzlRVvddLuV2P0930Rbn1Gp
 1sfhHhCC46gxaqGGdIIdXwpYcs0cwiHK6w3/5BryuR/Payxl6pE0SJgObkxjfj4ybtP+GAFZx3Y
 Vqxpys80cna/lKi0tV/9T5KsOvv9aDhI/wdwzL1nQmSw8atSYAnBdeGs5PCjMJ9bosKcobHHnu+
 AOQoiMcc3Ghb25tVWZgHDkohH/WGhcNiBmgbR0MMyb9up1LmxQ/S/9NmX8+bN9Eg7t8f8Yp99w8
 hS4nfwK7aqy9lLu6DPcLfe1lhOYxDnx2Eg7vBIXFnVAbth9BSB8ccBEgqMgz5dRwtGXdEHJf7C2
 R9jTyG5Cpf+dUhIpPdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfXwzdQO8zQ1ERE
 cBOboYBLbRpmqzv3mKHT0NsbgDLhbvuzxSxRs5ECxrw8OXBGp78nWUxtrz+Sp4y1jSqp2WUkG1I
 4qZlNmDn7PXxSLdbNszxtqhc9v+KJnI=
X-Proofpoint-ORIG-GUID: 1Knj39SCnd70oYitL8m3DR9FRGcSVC47
X-Proofpoint-GUID: 1Knj39SCnd70oYitL8m3DR9FRGcSVC47
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ea4fd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=pGLkceISAAAA:8 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=4XcMWytRO3AA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Yk_ucIiMhIRL_01elooA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_045024_093913_E1CAC0ED 
X-CRM114-Status: GOOD (  11.49  )
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

----- Forwarded message from Troels Vognbjerg <hekatombe@gmail.com> -----

Date: Sun, 6 Sep 2026 15:18:05 +0200
From: Troels Vognbjerg <hekatombe@gmail.com>
To: linux-firmware@kernel.org
Subject: ath12k: QCC2072 missing board data for ASUS UX3407NA and UX3607OA
Message-ID: <CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com>

Hi

I have been working on getting the Wifi working on a pair of Asus
UX3407NA and UX3607OA laptops.
Both came with QCC2072 WLAN cards.
The current linux-firmware (2026-08-10)
"ath12k/QCC2072/hw1.0/board-2.bin" does not contain board names for
these devices:
PCI vendor/device:       17cb:1112
subsystem vendor/device: 105b:e14f
qmi-chip-id:             33
qmi-board-id:            255

The current firmware will work with both laptops if I add the
following two lines to ath12k/QCC2072/hw1.0/board-2.bin:
bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255

Relevant dmesg from the UX3407NA laptop before the modification:
[    4.435741] ath12k_wifi7_pci 0004:01:00.0: BAR 0 [mem
0x78400000-0x785fffff 64bit]: assigned
[    4.435805] ath12k_wifi7_pci 0004:01:00.0: enabling device (0000 -> 0002)
[    4.435838] ath12k_wifi7_pci 0004:01:00.0: Wi-Fi 7 Hardware name:
qcc2072 hw1.0
[    4.439197] ath12k_wifi7_pci 0004:01:00.0: MSI vectors: 16
[    4.994025] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x21 chip_family
0x4 board_id 0xff soc_id 0x40292100
[    4.994038] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x100581de
fw_build_timestamp 2024-09-11 23:52 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
[    5.001274] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
data for bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255,variant=UX3407Q
from ath12k/QCC2072/hw1.0/board-2.bin
[    5.001281] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
data for bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255
from ath12k/QCC2072/hw1.0/board-2.bin
[    5.001285] ath12k_wifi7_pci 0004:01:00.0: failed to fetch
board.bin from QCC2072/hw1.0
[    5.001288] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load bdf:
[    5.001290] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load board
data file:-2

And after:
[    4.439356] ath12k_wifi7_pci 0004:01:00.0: BAR 0 [mem
0x78400000-0x785fffff 64bit]: assigned
[    4.439682] ath12k_wifi7_pci 0004:01:00.0: enabling device (0000 -> 0002)
[    4.440005] ath12k_wifi7_pci 0004:01:00.0: Wi-Fi 7 Hardware name:
qcc2072 hw1.0
[    4.440870] ath12k_wifi7_pci 0004:01:00.0: MSI vectors: 16
[    4.993062] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x21 chip_family
0x4 board_id 0xff soc_id 0x40292100
[    4.993066] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x100581de
fw_build_timestamp 2024-09-11 23:52 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

The modified board file:
$ ath12k-bdencoder  --info board-2.bin
FileSize: 401480
FileCRC32: 6b132b00
FileMD5: 1d137f4ea06c32f3597fe9e1d9f0511e
BoardNames[0]: 'bus=pci,vendor=17cb,device=1112,subsystem-vendor=17cb,subsystem-device=1110,qmi-chip-id=33,qmi-board-id=24','bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e15a,qmi-chip-id=33,qmi-board-id=24','bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255,variant=UX3407Q','bus=pci,vendor=17cb,device=1112,subsystem-vendor=105b,subsystem-device=e14f,qmi-chip-id=33,qmi-board-id=255'
BoardLength[0]: 125452
BoardCRC32[0]: d922b5f6
BoardMD5[0]: d0b4209b75e695b5752e5289630cb3f0
BoardNames[1]: 'bus=pci,vendor=17cb,device=1112,subsystem-vendor=17cb,subsystem-device=1110,qmi-chip-id=33,qmi-board-id=19'
BoardLength[1]: 125452
BoardCRC32[1]: 7eab4392
BoardMD5[1]: 01957cbb3d541f58e743537b852f0c7a
BoardNames[2]: 'bus=pci,vendor=17cb,device=1112,subsystem-vendor=17cb,subsystem-device=1110,qmi-chip-id=33,qmi-board-id=12'
BoardLength[2]: 125452
BoardCRC32[2]: 11faa8d7
BoardMD5[2]: f795b5ab69acb96dddacdf75083e07b0
RegdbNames[0]: 'bus=pci'
RegdbLength[0]: 24310
RegdbCRC32[0]: 891b8f74
RegdbMD5[0]: bf34dcd8532537769c28cb484b3568c6
--
Regards,
Troels Vognbjerg

----- End forwarded message -----

-- 
With best wishes
Dmitry

