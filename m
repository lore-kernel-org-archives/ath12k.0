Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD4C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTgcOwD1pQslP9DjDPthnl7fULdNoTIo2VyDHxYti00=; b=Klm4AbzpzogoqVnDRHNhfYNLs9
	3m6Eq+221TtPqWvcurUPEI2ukMUr89C6cQiTFIH0TFWHKpck5Zw+H78534VoKMbH8JK5WdnXgDPUW
	8X0rrFRSeHXlLLhR0F8qzqc1dTXSti+lpoNb0v2amzR8TBN+LCNQbQmj1EOu2ULVP6X/vMCrnVdMT
	PoASQBJj+iDUH8jgUfcUSGDnCdW7Qkl71uMfv9zeh0KM9khTDnQQFVvuIediyrzV9ub2gkfJRsG/0
	WuLuyAGMQvCMxImS+L6WtvxURyaEb6DluLtp64SgmbrUsa1rihIfxji5Oe4nQl2JLahcahDNsZwnj
	VFozybgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzf-00000003hCw-1211;
	Mon, 23 Jun 2025 18:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTS-000000036vY-1i1k
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9BclS000866
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTgcOwD1pQslP9DjDPthnl7fULdNoTIo2VyDHxYti00=; b=L8DpsJeAEox99YDa
	kp+4XACYtiQN37gU5VWpXmOs10KDYkQkgJAttXyruX43vtpnQzrcwWlFBt9f3kTd
	OuCh4yb7fZYqRkiM7hhzRj2fUOlryiUrRr0odstBsc4suGsBAdIkgesKYQHr1sYC
	HFk3l+wMPKYM5CdX2CBVu0VI65D7yEmPtZt9Ss3UsuVXL0cVuDoGQfohZw6HjeyL
	XTtk0sybpBUXyFhRi6AG9B/QQngiGMP3Bwk2+le13JJJLqoahjJPmxOiI0xqwTE1
	sD52pFN6tW1wIOT/t87MJhVqjDAgjDZ4B8IBcXZDU9N/Dn0ta3+TCNY9TJoSZl7h
	9tcgnA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmjn12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7492e654cdeso1087922b3a.3
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690120; x=1751294920;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTgcOwD1pQslP9DjDPthnl7fULdNoTIo2VyDHxYti00=;
        b=kEhFYuwctjmWPGRjlAFSw9g88zj3jUud3LEmJlK9knwR0YV+VZDuRIzSlNbFey7GA2
         CedkIBelbCnwtcmdixT1HHlNhcgN8RkHD56cAv5/5LOb7a3V9tB3RUWl8VjrnRNNbO/H
         3Kidwe0OvjQALBE+m6LUpFw3hxE0tplts97PBCETYEcH6U22z/XglFY/zl67x4dXqrTu
         YW9z+EypdBFScrKDkNBRcyRGynoHNBlso2FuFhFxxmzpJgNAavwJsEVusUS8sVtC1c/Z
         VN3L/CSVQOD/CVqD2zh5tgwByQ4iyjq7A21NMqTyf5eEKbeMXSqP7CDfyu1TB40FYa17
         +y0g==
X-Gm-Message-State: AOJu0YxlV1L8LXP6BO0G7ujJb8WDxDg6rhp11m/ufW3RfuHaMFqOOtD9
	gBM7sA+KoFVuIH3+HlaniSCkOlRgDB3sGRZH3tMV12wCXratDEw3wZ9iqSV0DWvNHOH77XmiBf8
	7otTM98q+3i9jrjAgaUnoaRTPetR4q77cLcHXYqNRUGpHJElGCeru6L+cbo1eeYzn
X-Gm-Gg: ASbGncvBoCYjbNRoIuQIsJjOppnQoA2LtgEkrtJRA4EGcWuPow3roDFNRG8/G4QH7hN
	QJTKWrj/e0IrsIfl7SXLtu8bmDptQ4yyiauvU5x1583AOCwSxIbTgyW4H1XHWLXDu45ukA/pvAU
	+kMDKazMRLcPF0y+g1XzIUgLk69PyZupsjlmlwmw2wKN5YY2HEHjBLfOi5DZHNAEEXn6RKJmF6h
	AttD7pjA6D3P8lLnAzXH2oZTvimbmeWwKfNBmFjc6es9IR2HjnLWyZbjMcS9BlGBz+e8Fmr1dNa
	7Ml1KfXvl6MxDactRJUQpE7mYTHdJCDhmhuzqOXQfF9UxXSf8vdGyWpnP7U=
X-Received: by 2002:a05:6a00:8c04:b0:749:122f:5fe5 with SMTP id d2e1a72fcca58-749122f609bmr17361330b3a.18.1750690120294;
        Mon, 23 Jun 2025 07:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWmPgPVshHE/zr0NNaPcHLcbCD7fabUaWYiCqu25X7F8XzE1bxZybvxOBlBA18ztADQ3B0jA==
X-Received: by 2002:a05:6a00:8c04:b0:749:122f:5fe5 with SMTP id d2e1a72fcca58-749122f609bmr17361289b3a.18.1750690119838;
        Mon, 23 Jun 2025 07:48:39 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250618185635.750470-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250618185635.750470-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid accessing uninitialized
 arvif->ar during beacon miss
Message-Id: <175069011928.3758471.16087243533484607785.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: DPo2dKVyR9YdLxzWn98ZcVkwxXVQ1SDV
X-Proofpoint-ORIG-GUID: DPo2dKVyR9YdLxzWn98ZcVkwxXVQ1SDV
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68596949 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WQS1YfXabkAatbxEeBsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX9kAel0MCMQpp
 wQwiWup5zl+xj5Du7mrKoupgKgLGQ3rK2ITFX8t9gyojb2mtYZtZicE21iMAoeVk52CuRnlZNyR
 GYHmYWKUNuquTATyS41MsHR0zFoYjOzRKHzmgiYLdL/MpYv9hsVnyIDyp5fnazEOB8N4bbcQCEm
 U/TSeQzRb/3a9gfHk6SLNLHjyJbQJ7EvnUGqDaZTky0sCw4F29h4YVR1XSgju3yAnLNBHG8dWhn
 iCa2r/bFlUKDwcnMnJsq4UFCvFUD7DiRZHJzjLvK7vl+gmBoNUH0vwtvbYGzjsK29Ts5ncxuAiZ
 670J4nBvzXGqh/LiJSP4/NbaQ2TS6OfA2f2nx3KXJJfYK+72sbTALT6dZUFpF9oSn/0oZQAGovG
 ZHkKyVl/BypzrChj1wEdUt598jsmQlkd0DKn7SnmzTamTfYYPOIBp5c/ObW819kkdUHJFFJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074842_470126_932042A2 
X-CRM114-Status: GOOD (  11.74  )
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


On Thu, 19 Jun 2025 00:26:35 +0530, Rameshkumar Sundaram wrote:
> During beacon miss handling, ath12k driver iterates over active virtual
> interfaces (vifs) and attempts to access the radio object (ar) via
> arvif->deflink->ar.
> 
> However, after commit aa80f12f3bed ("wifi: ath12k: defer vdev creation for
> MLO"), arvif is linked to a radio only after vdev creation, typically when
> a channel is assigned or a scan is requested.
> For P2P capable devices, a default P2P interface is created by
> wpa_supplicant along with regular station interfaces, these serve as dummy
> interfaces for P2P-capable stations, lack an associated netdev and initiate
> frequent scans to discover neighbor p2p devices. When a scan is initiated
> on such P2P vifs, driver selects destination radio (ar) based on scan
> frequency, creates a scan vdev, and attaches arvif to the radio. Once the
> scan completes or is aborted, the scan vdev is deleted, detaching arvif
> from the radio and leaving arvif->ar uninitialized.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid accessing uninitialized arvif->ar during beacon miss
      commit: 36670b67de18f1e5d34900c5d2ac60a8970c293c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


