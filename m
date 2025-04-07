Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4581CC369A4
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHlZ7RCUM4VkVBGSYhmO9h2+v9soumRVmW0WAg8ToSQ=; b=zC3cK/2B6eHg6BcnvR2j3uO4jm
	dBqPLkY9ZXg0nH4YcKpduwSYXFZTfdzFUzByAa56gdigJ4CvWdoJZ9E9E55tACrlOOo9IfPOPKfra
	tMBU5dK36FDciCFO6pjT29a/239OVcKKaDrhGEH9Suf5hk+1Y03godPDeWWRxYvwN/E2JnkVe4YlN
	eScTNvloxH1D0Xu3xnUa29x59+XfwUw63ZrIJqyH+jXp8m3Scn5fAnqmnvSITWZiKVi06IPy6W6J+
	cDbPUggeZllFAd5upvwA1CP60GVVhnW7opRTkte+C53ZGh1AB1+0M/z3phhhgL2A/kAjQNd8yoc9v
	0g7m0IOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAG-000000018G5-037Q
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 16:17:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oKN-00000000wZq-0L1V
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 15:24:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dunT010872
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHlZ7RCUM4VkVBGSYhmO9h2+v9soumRVmW0WAg8ToSQ=; b=Ftj/D3LWzDftiOwd
	425IWqfggUw7ZRzzmqGgmptuSVG0nraIn/FCZC143DIm11AMU7SS9S6mowO5ZYFR
	stMvQH5f01KrwYvPS89X+M4gLs+xCuH+hiTkRHKWQCgo3z3+cLecxCRZZ9pdl+aN
	uWSbNNUguvLzqdUy5Ipu9lDGXQfXeCdI6h2fwjDGopaJpCLhqkSedT2vU4IWL8XK
	CX+LArjbP3Sge7s1t6AVK842aeCFeraUTrzsgBJWuZAtoAQaj9xN1u2jL9jlamMs
	Sd+U9HHNhpGllTu7tfZcgVykAbFCACLTPma+VEdE+GW0v5QgM+XwMscCJVRjCZAd
	sojGAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2mpk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 15:23:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ad50a3a9766so3137077a12.0
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039436; x=1744644236;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHlZ7RCUM4VkVBGSYhmO9h2+v9soumRVmW0WAg8ToSQ=;
        b=mQnXWgPp7p/isgjy/oJBG2hupCJ+TnyauKNQtF5S5lbTpmykdR05Ja9B8G8IoBt6bP
         pQbAtu47fbUsnVoxRx/2oIKCfc3VnCaRb5lm2Q9sR6tL03SDyg+5ElpWCpOF28eBIN3S
         z/hfU1KNqCDigzcOwWz/RaEhRJOlXt+2fympHvbUJyUcVrNBFCwq8lrHqF1XsnYpJyQ8
         alacwuAhfrx8wCOzcGpO4rxedb4Ac5rhlNbi9wVKlY8JjJPHA+LJmu+1CHHOHe970Dgi
         cZYGcgvkHJpR86MKs41seIyMjlrM+bX521Ig0YCa4WYmhLDOSL8BBKFU64NoHuzT2qIH
         Pn9w==
X-Gm-Message-State: AOJu0YyoOSSDWsMSOVezIWt8UB9tBdk7ZORPILdhAGfGtGuFgKuqXUTF
	Fd88Q6uiDKRxNJ8ezj86WcCBAAfBHVGWDIbsEUvtaBevGPR6PSql8ge5PLwRt7Le2L3tBYmEXLH
	zNTobA5P6UefoFdZbd1ddVSGz4mYMtLRI+/XAdtI360cDaMNwsWQdOvC1vIOu
X-Gm-Gg: ASbGnctRkOIezgP1thHwJhX6Y7N/TWtNwugFmoP+QId8xft6g4JYeFaw7N2I8FnhfwG
	Tbc0niw6M2HhH//EDKKrz8a1Z90uwp5ZGF+Yv+6cRcQm0i2sVl4Ajg3VUVwGZ4ALADzsaFBOnuc
	OqMIxjcawNBJLZPzfN07pmzXL+yeayT97IIBlsTgx6eW4yb8T9uCVmDO4QYXVZmqmM+v9VfWMgk
	QTTzSp0vz2iIS562W5rWF/ELdwwIOz5auxbwxdw58/fX3M1QwS9OQl1eRbMTChIaYoGQ4+GqPpj
	9s3BAWOk8qzqNKEB+BREVzOJ5kutaQrhPwhTel3diA5BAGCmX9r3
X-Received: by 2002:a05:6300:6681:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-20113d272a5mr15966699637.31.1744039435896;
        Mon, 07 Apr 2025 08:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTgjgqkDOtPTp2H2DjY6r5fOdX69d1zQKiktFj50uXmptg6Tcm1VK/rGYK8NEvTJday9BOOQ==
X-Received: by 2002:a05:6300:6681:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-20113d272a5mr15966637637.31.1744039435222;
        Mon, 07 Apr 2025 08:23:55 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7d3fsm8691592b3a.180.2025.04.07.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:23:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250402174032.2651221-1-praneesh.p@oss.qualcomm.com>
References: <20250402174032.2651221-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix memory leak during vdev_id
 mismatch
Message-Id: <174403943464.2068408.1950534582147740299.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 08:23:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: oOdgJ2HMIj9rJHHV8TG9V9ux0QA4lTOm
X-Proofpoint-GUID: oOdgJ2HMIj9rJHHV8TG9V9ux0QA4lTOm
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f3ee0d cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=oQbCsDu0WCP6IoMcAQ4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082359_128866_21A93BBE 
X-CRM114-Status: GOOD (  11.54  )
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


On Wed, 02 Apr 2025 23:10:32 +0530, P Praneesh wrote:
> Currently driver enables vdev_id check as part of the bank configuration
> in ath12k_dp_tx_get_vdev_bank_config(). This check ensures that the vdev_id
> configured in the bank register aligns with the vdev_id in the packet's
> address search table within the firmware. If there is a mismatch, the
> firmware forwards the packet with the HTT status
> HAL_WBM_REL_HTT_TX_COMP_STATUS_VDEVID_MISMATCH. Since driver does not
> handle this vdev_id mismatch HTT status, the corresponding buffers are not
> freed properly, causing a memory leak. Fix this issue by adding handling to
> free the buffers when a vdev_id mismatch HTT status is encountered.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix memory leak during vdev_id mismatch
      commit: 75ec94db880b1e4b4f9182885d60db0db6e2ee56

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


