Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D0CD3439
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3mBsFpKwPQKIyMmFcNYgNvNlST272PJWU6KGY+4LoM=; b=IJ4dGWuJn6t2UxFm2t8vxpfG0E
	pVqarVik0hwZHyRCRVss5tUGlbrppV0EBeQEkQiSxKgW9gnQs6omRyXk7zK6+shgmpnmZgzNWC7OW
	LdvTHXsLUd2px8rw3LHRWxgWzBpNlRDLOKi3JZZRgNqaYV3bQchFFEbz3M1oDnuOFDSlVhTRqOvbM
	8J8aXp/5M/n7eQK9geyDQNUVAdzOZcFngnh37dAUPtkN0t8i/KgyIihUvh10OWy2sO5/jNRQCoKih
	gXdwWbjKKCkPX4GdgPeaiHPJN9a6WuqP78PqMYzv/6xJ0AGkyB6GsCnv3lgJpWDdFriyFo3B3BaFf
	W2Eg0zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAk-0000000DQ4e-3Xj4;
	Mon, 04 May 2026 14:21:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAg-0000000DQ2k-1UXK
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 14:21:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4DLU4128828
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 14:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3mBsFpKwPQKIyMmFcNYgNvNlST272PJWU6KGY+4LoM=; b=LqIZ5zMDIZBHUV0v
	dsKGzVN3pJfU1cb1VuA+mn1B88bEskI0pn+GHz87JshhI+469QO0r5RCY2cu+GEJ
	64Vb2xUAr8Q+uInafHd0IuBdvGjogcfT7HuBK4WMirQ9+DYvMNsORHzCIw2dHug6
	qWBGmC/4JQq9A628PWIMxDj2BRVZolGjjF9ZSzGpuDlqjTvK4p4cC/erx73DjPWI
	4GR8kcp7gRPFIS20qEmK7xVRL8D/ZLO0CZEdqdiTCaiCOPLCpXe9w5Fof+CqNnPx
	ErZIs0VAkNLaLkT6Vy2QlHFKv1vsD2ARjhkJUrHL10yWAqt0b5AGzSPJUlMrG/c4
	tLXVew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw0s4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 14:21:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12df9e440d3so4957556c88.0
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777904475; x=1778509275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3mBsFpKwPQKIyMmFcNYgNvNlST272PJWU6KGY+4LoM=;
        b=he/sVfDJMNkRKCYGAQRA0/xarudNL1jJUqfZEI3pOppwKf/yVABA5I9P+RwV1nNB1R
         xh9cmAT4QCSBSDQHVXfCtp2t2opAWq0qqAUYFUD+6oy5zxUQaM2zEhvg0FOoIRyUMOyF
         6ApktJQ2BuUiNf6e/1nOKv9nruefg6iIANObQizMmU67st/govFX2RG3D43w10bxEupF
         LDevE6RwTM6Q50hILV4b8TFE/oyZFg62krmJDOJ4BBwzXWS5G2aqGVYuuS2urD0f7fk2
         nPDZ+b8TvYRJ3YpPOZYbA+QA8R3FHZ7W/Ke2PTRoZ/1GfZAIvzm3c9XmYL4onW/YStIK
         ISyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904475; x=1778509275;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3mBsFpKwPQKIyMmFcNYgNvNlST272PJWU6KGY+4LoM=;
        b=fi2dgeee74NV4tZT5rtsAtuyALjU0+36f5IQ71/RAbGjh9UUcddIHhWsASUidNWV4m
         /qWY2UpxzkQbS1AMLfECo64KZEAvhcBDk2Kd91Mone6uQfCwyUcRCsJqz5bS9uVg09CR
         1L0QgqZG+cEd0kbQDQlEuQFYMpcKSY5TuglBz2iAMGMAInDMoAkOyGTLHkjbcGPl/2dT
         3hgGJeO03jkppHXi+Z6fhAQDijBrtUXqE9bYWmiA81N4NflOBwjDOo1uqUh+uZXwaa9X
         aVOPrG2KOSfgs6668KLvGHVpTz/58MwWmuV8GSlCMhjPfnaMPHf93IweNlVyCGweqyFf
         7lwA==
X-Gm-Message-State: AOJu0YyROm0jQtfcizsK2aqLXmw+Nf4Y6dIrfGe4F3Vs5Pdz/NsdnwIu
	n6HxUTWDe7gKpC7o74WfzGhZjy0O+vluSvvx7oK6cCfgan1zUzlmA44hHWwnpvLefyaK3SoTu2P
	AzIVn/8v2wfEs7KyZ4LVUeMfxC0e4rQWVMqBj66P2VN2fhjjopmCtLqar9mo52nZD
X-Gm-Gg: AeBDievlO0hl3y7nx7g51Irg346zzQXwyAWJB8c4L4bvtSaIWAoLdF5SEHDBfOvQbge
	0CJmGxy+2D5vdlxKuQSJmqAGvdrAFKxXu12jyIHj9BWbtLPG7hGbKFp/VXmbVbOSXTX0cRCK7hh
	jvCuzpr6/Xi79g+ObOxbiAcZKMVbL5VMmO6NGFpu4AyxqkkEECeKAmddyolMgbt6/wArovqR7Qq
	UgAHFOutU690NmWDsh2oi6x9/OOh1kWfvfvtb28sVT8T5XfpYGMS+9CyjH+GdPi1zdCctpC65Xm
	2vjQtKhs6HDTUyBxwn2F/Ckq733GKI/5aPK9VcQbCLimIMPZ1bdK+kyoBJKqpFLLPWts0vGziZ4
	1rAd6zQTHAKPcFbJBdO7rYuuDrSj+Mhd8k2oq8clin/HaVUIbs8TVRrL6Fe+WGjmRNsNhPINpnn
	csPxKjm6vHAZM=
X-Received: by 2002:a05:7022:f404:b0:12d:de3f:f3db with SMTP id a92af1059eb24-12dfd844f3cmr3219352c88.37.1777904475430;
        Mon, 04 May 2026 07:21:15 -0700 (PDT)
X-Received: by 2002:a05:7022:f404:b0:12d:de3f:f3db with SMTP id a92af1059eb24-12dfd844f3cmr3219327c88.37.1777904474814;
        Mon, 04 May 2026 07:21:14 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8452edesm16546186c88.14.2026.05.04.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:21:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260427103011.2983269-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20260427103011.2983269-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: initialize RSSI dBm conversion
 event state
Message-Id: <177790447392.1253723.2410134562149698817.b4-ty@oss.qualcomm.com>
Date: Mon, 04 May 2026 07:21:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8ab5c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_I3uSAleeTxDR0ymUIQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Jejq2eq89sDdxunjrKDV4J1hxOBVENmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0OSBTYWx0ZWRfXy0c40opO4tZP
 YlIKgghPkZEY2nx4A0Fff4qWvwZ5xmjioLriQqKehZCJ6z7HoKdgDRycu/n9PBmFwVF65ry8U2l
 /6E7OeTVTyAO9m2WigAAaIdbdWHeb1Ur0Ckvnq1bph3k3ehSDWqDl2yy9hG7F5PVeWIEVx/89Kf
 k/atM4fVmpGQ7nxdmFPZNTSoV4gwmjNfvNEYWFZEkfncU825e8LapQB3Dj9OApmJ91avosEJTtf
 fcGOX8+dnUBsISNeHOxGIuiu+5m1ZnytHHopptLVhlHbH8EQuUrNrpjJW1KCGkCjoEbLcRQrlo4
 0XX7Wf90OIJxR7DYnlJpceRLgNBkzpAKGf3MJtykg3bKEgUYV8BjpuiW/Jk1829pD3Y/H6NDOPi
 mg2ZdBf1gEOnMRpmTlpX6BUgUNW+whv9aw2eQkjYWF+rIPDOg5C/r9sSO3jWDkKN3y4MhptIsxH
 v0EPMBLbWMNalUkqfdA==
X-Proofpoint-ORIG-GUID: Jejq2eq89sDdxunjrKDV4J1hxOBVENmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_072118_517048_333D784D 
X-CRM114-Status: UNSURE (   8.82  )
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


On Mon, 27 Apr 2026 16:00:11 +0530, Rameshkumar Sundaram wrote:
> Currently, the RSSI dBm conversion event handler leaves struct
> ath12k_wmi_rssi_dbm_conv_info_arg uninitialized on the stack before
> calling the TLV parser. If one of the optional sub-TLVs is absent, the
> corresponding *_present flag retains stack garbage and later gets read
> in ath12k_wmi_update_rssi_offsets(). With UBSAN enabled this triggers an
> invalid-load report for _Bool:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: initialize RSSI dBm conversion event state
      commit: 81594a12d5cecb3ab35b603a00037c7c3ee87ab2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


