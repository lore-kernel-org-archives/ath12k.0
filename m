Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515A7C4451C
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWygTX5Qf438gPLKLUw/9chHA39pXSe+DrGkrf6GAzI=; b=tbWlz38O6FIfaXZhNySVWfRGI+
	2mvwc/Sj2ulUdoAcV2SR0kLw3Yonskqtb4OYw8CrgZalT/jb7yFfg94D8eHpZcLZiXEpCjw+Mwz1t
	lTsCRWxBYiIMgoZNsA/OC+q70/ApvndfgzFcWCDskL6bKWiJ9rAcLIqg82loQe0uGV4LqEgCCIsYK
	/uesfBsq0OyLdg9d29gIjLra9hHd/ix6M00kKZ3bpMuIKRFtgOhlZZIg7zUGLVSeTZGfyl+Nvsl0n
	klSQl5GoLLQkLWSH7VjAbr+ssMHkGfiu4ClyL+mL4I/cY7bTQpZ6m6T7z9UlxrSPdU4XrRxu+ghbb
	ZQm6TL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfb-0000000AKqn-3moZ;
	Tue, 21 Jul 2026 20:02:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfY-0000000AKq1-4Axo
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 20:02:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHR8Nk2375963
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWygTX5Qf438gPLKLUw/9chHA39pXSe+DrGkrf6GAzI=; b=Etr5ynvRg4fBJdeI
	owT68X7JlqpvzM1kfNLkdMykWrWefTF/BTj7MNxvJUX8vB/sJuIxz5StutMJKMLp
	5IecILEE+BJyJszNsAbKPigQJQM9IDs2yPEQB/GZmT+lQzxfw7ZJNJxeKy5pPGzG
	h3pTTDWIy+rVVpPQ9rAY95Zzo2kkglKxOmw0bW0fgxGO77NarnOijYIB1eRoroTp
	jApcz8zhk1umI7zcyX5I73p7lgxfG63LDI1swmtQ/yMX8tQXZ+SJBaJIdrPZCkBu
	t/jB/kAXg5vVhjclFH4ES5OX8ZAsJWTW+ARmKwR5EAoHKspOKJOv+/CZJHWTFdsy
	wEhWbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a8nsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so188160515ad.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784664143; x=1785268943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWygTX5Qf438gPLKLUw/9chHA39pXSe+DrGkrf6GAzI=;
        b=cQSIczXHGiJ2nTInpQm7irBWws+PWgKr0xRRhWoCxiLEMFhjcPY3uYnU1csXVCGY3/
         gT7DwWXbaxTC1HydxJzt8vGYQ6o9xsNdSp88mHWqIVymg0isG5+eSe4AHOeGp3udBYsm
         zE5ngYyG2Ie9pm6VrpQA0lJbbJqHG4Zta/cQZ1N7nCbfgE9fXocTzZjZybhYlq4Dl2gC
         kLhlVizQwml3dW3Ffl8svVAnykRff5ws2sEE86nlws28OpNlK1IbUr7H65gV3AfimtKX
         rRyiDnld1vTQPrbPEYhobBJJktPw7KTKuvSW9dvFMTL1+Ho4jqxEDHKy+cgUjIBr9Hez
         yCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784664143; x=1785268943;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWygTX5Qf438gPLKLUw/9chHA39pXSe+DrGkrf6GAzI=;
        b=GD3/izbDIf6ybaSVpCb680Bk2UjIz4xC8QVefrvB8EWQjZgFZns4VwWFuW8OBOJhss
         XlA6WoP1kaNy3sVqu546di6Kfrx744vKYHr9ULO/cI+bWVBY4Def48pg2Y0tX0bsr88s
         tPR/+cfJzES924bT3+G3uohDx0fupt1sWlZIhnrarAvab7AFuRsL/BL2vsmztZvaaM4Q
         hOKOYhT5Cy4mkPG+yIx9JDOfbbyyKElNjTSN5fFXkfR9w8Y5AGCzKgb5n0XQYKB/OhLR
         B9C/ciZPQIc3CDH3NtkXobRRX2DJDxcbsq+iXSBOhNld+NVq8hVDqRPR3K2m072ami5O
         L5xw==
X-Forwarded-Encrypted: i=1; AHgh+RqhLoYrEva9fjp4hG1bqEZDdORUi8uBXGleTh/9s0DZmJEnwb27z2fjA2pWViiH9htGP4JKuNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCD4dOQ2fzOeOJLAjmn5coy3+qimn42oVajb46r3tELM1YPLdp
	TxfQgi40RVUDMIqLWLsgSeHSznrVuYSw+/X93DwO0iFMJmIuApiR/8aTMJBnfLf+VekcFiv33iw
	ZUogOCxmag9ZOhNP/UIoksEZaNN77lDCzab140mCo9ApUOq5OK3z4P2eSCMG1s48atwEJfLKY
X-Gm-Gg: AR+sD13sqeiyeiWXuz+uhTKWqYTDrHZhw2uvQFOj7F0gwMkRirBhZCmAT5OC/waDEM+
	BJ4yMWa2tN+AvjKKKyxW2AV/ZIbYSyjwfTkmWplBpixxX7tZsdn6fnbH85rZRaVZ+8Gw4Vvi5Z3
	BZgi2EN+xqXRraj4T8tbOR33k9UljVpqXsXnq/ppZX7ApXcMXDEU7DUUUFocCp6oafNGLoxa/y7
	fl/JjCLKzYJxVQaDsKC8So/vSe9ge8QFOUTpRHNNIkdHVBwNmosw82MeXMG1uHSE69bUokbg2Gd
	giZGrt8YhwBAdspTGO5cAbNvkKn4xisX7Gn6cdOIqhKCMz9gM2+3QMpdfES6UKyXb0/dXDg1tSr
	B6CZ1JTAQKV6A9pl0Z80bGN/JOn/Vy2l/+tVFXScNyhy5cyLhC6Z+hCk=
X-Received: by 2002:a05:6a20:4c8:b0:3c4:1c9f:d90 with SMTP id adf61e73a8af0-3c41c9f2e30mr3065832637.39.1784664143063;
        Tue, 21 Jul 2026 13:02:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:4c8:b0:3c4:1c9f:d90 with SMTP id adf61e73a8af0-3c41c9f2e30mr3065797637.39.1784664142461;
        Tue, 21 Jul 2026 13:02:22 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm1574958eec.3.2026.07.21.13.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:02:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
References: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid buffer overread in
 ath12k_wmi_op_rx()
Message-Id: <178466414122.1747165.8361004690432718410.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:02:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX08b+zuqpNa9M
 3AbD1jNsx7kUTwG6zhgOjqx3/vHUP3UTDUl3+4yhbjWxtwf6T61eK6WMzweJ96NB8NAdSEuNVoM
 IxhuROPBGuOlNMwUetcqj0QZAJWLSviyayDDxMq4ZBl2ZkRk8QH/aH3NZB0IMuK1VmKnCyElVjD
 3CxaCfGfhnfQMEtilKw6xoO1/aWkS54wI3llx+Xp5q2HVVg1KBYzdvj0qtL6yQBjVdT//rJPU03
 cd4kPzM1mFruHRZ3tUJ2mrjR0v/i7vFtr/Of7Pin7rjSY1uTdZoCaynoL7VL7g6rC+OfFCg/dHb
 ZS0zYPdx9/suPjWyEdW/Qxhdbtgvty4xGkuLS4Ym27cduYtPO5SozGCBEhyDrsHhlVQFymaHTYE
 Sxpp4prXBMel/IVi4N5DtqQmgPh3p5od18CkXsPYPF+XVpquIMK9bnTEfJB+BomvsC49TFWzOmD
 4JKh/xBnTKz7bPXb/uA==
X-Proofpoint-GUID: 8efLPemi8BTpmeZYQfuY7hXnYOLKMcEB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfXwBKVAwG6J+hR
 GNhzF1qJvrVGWsFcLRszKUdvBOJseNabgLBreuKqX8kVSixy/7ulpqGIt5MiqYHaxrx8N+t/c86
 tKIpBesnADcdU3l/gpRhfHNibSBVqhg=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fd050 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ymRfW-ZP9UeHRcWsrQ4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8efLPemi8BTpmeZYQfuY7hXnYOLKMcEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_130225_157160_130167DD 
X-CRM114-Status: GOOD (  10.27  )
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


On Thu, 16 Jul 2026 13:01:11 -0700, Jeff Johnson wrote:
> Currently, in ath12k_wmi_op_rx(), the firmware buffer is read without
> first verifying that the buffer has enough data to hold a header. This
> could result in a buffer overread.
> 
> Update the logic to verify the buffer contains at least enough data to
> hold a wmi_cmd_hdr before reading from the buffer.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
      commit: 485884f0fac28c8281fa66bc2c359d06e6747543

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


