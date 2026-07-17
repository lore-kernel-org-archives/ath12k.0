Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ADFC4450A
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 01:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfMjdix74msaRvIWwfm+9FyHwm1EorjtAesSIN9caMc=; b=UpkVxwky5sjWRIpNIbUAzVS9ju
	i3DHiW2sYkOZd4iRLxyOn4hLyTrKGmC5AVJzJiTad9T72CPwF1rh+veYrSAukxu8QoCJNwoPwJCM2
	tJmfbYJnHHp5VaFa3kYgpCsjx38zwY23PfRBtNnox0o305tIBAqu200sCwK9BM79zdIfk1gDJFCs7
	8EdKWvNQSuMyp6mX8HmYzV5Buxzp1x59E65LpsmJgEtEjkc5T6GLgCEwOKVQBrU/Cc99foVr96EQj
	R3w84IvBt9RJbd8jp8GXuhpAd4Ee9IpQ/kVVaI/5MjVJ0Cw8B5WHG6rnN0WL/BfGuOpkO+SBgW/z7
	tk8p8y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXqB-00000000vpb-2hTy;
	Fri, 17 Jul 2026 01:58:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXq9-00000000vpE-2B0U
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 01:58:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIZUC010475
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfMjdix74msaRvIWwfm+9FyHwm1EorjtAesSIN9caMc=; b=ofiaQ0b23QEAtgjg
	ovVhtbb6ZHiidNLCobEzdpu9mftmD9sKTwJu7x+NSpJyiT2cePajCa7P3BGgZlFl
	6I/NWuEbWoKdDC0VnYvqVgoH7hGm/gIx8r/IBNpMrp9bqhRbK5gDNIT0wR/tzlKE
	isq2DbDUm0KLLfATdjP6mHUzfrzETXWGFHquq2G06a1vUL/4ULxfxeVYEDRyIOEr
	IvcA8bAM2a2jCFzuq1eGql0vyWEdnRhhXxv51vZnMYWmMwomLdmwWZX3dYotrUyp
	wosZ1+jCs2ZQh1jiF2xDtpKMjN4O7Wt7oQlCAYuJWdrPYKK9/04Q/m7DWZZfyqh9
	QtJ/IA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex43k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:58:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so7174745ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784253491; x=1784858291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfMjdix74msaRvIWwfm+9FyHwm1EorjtAesSIN9caMc=;
        b=RYGE7MVwR30uDQqrumWMDBfFX/wiTe7naU4mIns0AdndKsg8zWJRuJDrv6KnWfHv+O
         yBJ6luwoxhgUEyRmc7/KRARxqHB75M96NLxKym4sMULlznYstw4YDY4fc/VpadENRMGu
         Bj1xD0l0P1foaB02aMWK6q1fppu78YdPEkKAo5UkIpLbKyU/22Z+2glxmTINWBy6SYWK
         /NkG34cn+Hu6w+PSCzBwCwH2Nt/ZcyC2+me5c0PYmGYouOhnGnjcsSB9o2RsOjly//jy
         f3sZa7wRHuueNfw8QmP+EANuoo/A7fdmrQwFretSwFaINzmdaWx5wMxDsdg3RNnJmqJA
         59CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784253491; x=1784858291;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfMjdix74msaRvIWwfm+9FyHwm1EorjtAesSIN9caMc=;
        b=nY/VhGOb0Oa833yKes9HKDt9+zsDDFWKC1oTGkWnZT9nnq5maWuAGKorU3Yz7Zt0Lq
         j9h1QM5+4aGAtqfHfSLScVDO1wokrdvwb6oLAvtdahT52pM8WqrsQ7hg8HBwf2T+F9cv
         9r8PvkSsqZqVwXFKfF9JatnrOcmfOQvxGCTc+KwBMJiLWhsnzvnWloftnfzoJxtRH6JF
         P1XlrkAuVuB+SdY+9dkmz3Cvc6At/HJnt+B9jmyQi6eyqP/gNoFdEm3VdNCus4wfTuN3
         oW+nX7E+Xq93Ug7s3bBllbT+iIVjtDdNT2l/SkKBj0+lt8GqQj4bM/fXFByEOPuWcnDP
         Sz6A==
X-Forwarded-Encrypted: i=1; AHgh+RqARCjjtkrg0LRzmj0WTxUkiHXP2E5k+3cWWBtWS7d6QzMiLCtfn7yfYGENyNRqYnnQSxxhXSs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQB8ftWqtGUzcLZEnP95zvA6B/OVx8XGkOETijckxw3wMQvqwh
	fzubayTbQnyDqMvmbGrpV3xU7cfK+3wS6/5Aax7j0d8zVGqlWxuxNLrsiBO+zSbzKllBtKorFT9
	eG0Js6Ddf2z+xvLQUP4IhuTP0FwB+wShFCcNYZAGiDr4uAPabDP1TFnR6q6yoFLyl
X-Gm-Gg: AfdE7ckiKDpzR5SJOMdRzL9g9R4DUO8lARVGPifptUEs4LU/En6H0DVEIeojNL4dASc
	BEN4TuZMX463LupKlZG7DaCGF3/4qjm4fWkbEgkCjOcxhi25OwXah0A8S0mvnewjn++LkMNrM0a
	do25MVODpB58SBEf+lGKeXYDXPwwgXPDVqkCyXnKj6gTJWwhCpbhPaKWq72CyX7vd/yRKZTOfkY
	NL6dDfHDxumnoE+7ioKmCNp9a3rlDfIIPq7965F0iGkvWGxCF12CH+qEJn2Xiwt7EEY7nacvaHS
	a2al7voEmbk4k19MC3s9eTps0sIDNRAyM1ghFJheJW6cYcILcnMPVUpp+l8X8o9+0BCv2//rvIO
	jx3WlSsnodiMkS8Z60WvpHI8h0lFxuWC8UhMKNhdSx+CeHZgaNd3e0iDxSO4e+WJ6RkfnjsX5
X-Received: by 2002:a17:902:ea10:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2cf1f29ea6amr57108305ad.8.1784253490756;
        Thu, 16 Jul 2026 18:58:10 -0700 (PDT)
X-Received: by 2002:a17:902:ea10:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2cf1f29ea6amr57108085ad.8.1784253490323;
        Thu, 16 Jul 2026 18:58:10 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34713fe1sm1858275ad.55.2026.07.16.18.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 18:58:09 -0700 (PDT)
Message-ID: <f9f8d6db-067e-4680-81d7-391e18a6a36e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:58:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid buffer overread in
 ath12k_wmi_op_rx()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a598c33 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ymRfW-ZP9UeHRcWsrQ4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: k9Y1BxzNsP7Tds0ozC6x9RgUV_iw7i4q
X-Proofpoint-GUID: k9Y1BxzNsP7Tds0ozC6x9RgUV_iw7i4q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX4pFCjbszx+U0
 fu/aiP9KTwWP2auf51Aq6rJ37vU8n7xy+r85Oy5vI2DDVHm5Ft2IiKzSs3GGLvAyYIXr2GKLNcy
 ++7ZzhGKZpTgV75D03q52OaTqBqH6Ik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX4rD14Qd5JeVH
 gY/9vFa1UCWjDUNgRk+azXc7lHv4+Sygmp0Ku009l4UtqnE945TcXH4LO7zlBbO+pYyPVuumyo8
 M4DNZWPEkhhXP/u1E2vBBDFArHfY2SynYeSeSaDBHxciddHROyf2g+buoFi0of4cEl4sdyjydHe
 BBvqxyZxQLsqnQaxEM5RwA7ZTG8gBP7RWlW0bcLYttlq2VLSk+XocUP0Ey63haWcEzrm22EyBLi
 +aLVmTKkIPj4zOhESGZwXmZTu3gFjV3f9WPwfil9X1CTegnj3RPga2JsrrqCQGhG63mEstr7x0n
 lFq5Dxe1BAQEZjwdpEDaub5j/yM0iaKfP3fEedBu6DscQKiMQLTOU5Ghx5OHAgwESnyFDA98G/v
 ZKwM5SBiiRlXyENJtLYarAMEbEh7254D1VImgx3FmWt+InxeMw+rDds+Ezi8hZtNv+1NS6PX7BE
 MQGGm9L08dWoZ4BAOmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_185813_702928_601C4800 
X-CRM114-Status: UNSURE (   9.83  )
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



On 7/17/2026 4:01 AM, Jeff Johnson wrote:
> Currently, in ath12k_wmi_op_rx(), the firmware buffer is read without
> first verifying that the buffer has enough data to hold a header. This
> could result in a buffer overread.
> 
> Update the logic to verify the buffer contains at least enough data to
> hold a wmi_cmd_hdr before reading from the buffer.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

