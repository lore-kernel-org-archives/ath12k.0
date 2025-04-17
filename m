Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D5C369CA
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YnGaO+20oY81gWUh2DeP3+hX6KtdcrAfVfj6JZUno0=; b=EHCKqUMQqeIfFpzlcaq0MOLoE+
	Ui80hjAEPjetC5WwwaGeYfiFnvZ2+9HoDy69LH+OiLlyb/k7RkQky1cKJrQ2BO3DaHg8lXvPA7ESv
	YC6kIMK58+op7zz2rr0bT26Vnl1hVhpitM1B63WaI+Nd9cL7BZKMiyxq99iVNXQ0lJW5xwBWchXlT
	qFH5jF7eiwGzESdzxHBOKIfxhNSmlfzQOHQMnAuHOa3uDyHD1PjNN4c+7UnhLsc9+o3VcZroGjnZw
	ClS6YzhWSVqzyhVzZkNmK1n/CrVCwFFJsqLuOfjriFsaUS93TOy4hnQ3uDJQtZsCvqv89jFkjwdDf
	oHwyU5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAz-0000000EVUE-1QDs;
	Thu, 17 Apr 2025 22:57:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAu-0000000EVOZ-0Iyl
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCluS3013691
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YnGaO+20oY81gWUh2DeP3+hX6KtdcrAfVfj6JZUno0=; b=bzXWYKpizF++2I0F
	nryR5cbh55C56//gSoI4CtzRM5ZHJu72DGKh+sSVVmprkHyG2Q8jxLP1Df5ZI+av
	dEpJTvCR0KxshhYilb5xkaTxtbZ2BU/UjTtyDnPp0Q8SmkSvwGTK85sztEGYP04Z
	BK+CyXM1VI1uPqBnMEcfVz46EMgeCN3md15fgtZeLsd+rCF5lNH4Xf18CrA5FTdt
	eNBnOOQBcRpwYqNPiN3TuW/Nd2k06IgLQUgdwRQUVbe3orFy8lQRgYcrOxCa4D5M
	oigw4UyPBzaPHYRbGaO9QXiv1dgPrceF1BolEqTHs/idJcp36VTOCxRe2fveXu+S
	k1VruA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjra21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7375e2642b4so877401b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930658; x=1745535458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YnGaO+20oY81gWUh2DeP3+hX6KtdcrAfVfj6JZUno0=;
        b=Gc2wvP8BZXge2MSWmsYLY3MmsSjaQibKEtQzhxLvhC2TI0B2ciD3NIqtWbqhUya/yH
         exph3YhNXKkuCzBo00ok0hI9W6chC96sUc2kiauR8QLGOAXN2zngTZURW86aBDmjy9kW
         b1bQxcc6oRGMC917J6wVR4Uf13TsIXwoYjCENCN4E4A1E93wPmMKxF0CsDppe0AV7AKJ
         ybtJVSkQ9qQzR7sTKJwYMKW05j8TyVdeII4m3QEvPl8bomO+jnFWNwOl2MtelreaPUX3
         Pr1PSgyVnBmaFNZl+q/SKNxkgB6Q/hUby42viwTmt2kSt/fBPBVMqrYURlF0nu5dNcyo
         PAhw==
X-Forwarded-Encrypted: i=1; AJvYcCVKoROzpzAY5FeFGS6Sloy9P2KWChuTue9hkAqBSqL5wFnHqdnMz+UBk6Ijdh3Fc0jBLPUEMBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy24iF2SmgRAJNT0bayusPjI2W9NaRnEgQQzXtgrgBo/aAvsCB
	SaojbSyDYhbWOB5o6msFLy2ruUSChgo3Zcv6m6+s+SaBFZRSW09OO1F+RFbS5YkkNRnOI431NQM
	/rPTSYp0IwP2tA9j9sL5OaBySIkvjAOIGWeJYhoN/m45xQAO/bcaENLSjpogB
X-Gm-Gg: ASbGncsnI6xcuwPMZuUVUgPW7hRumiEV4VgyGuZVJEQ0rUGb8KZpmbKiDhnFRdmnaet
	XXWAOa1tUQaZ6tkOOcH8bkdbdc8bzqjPOarqleOz4kRHf5RaM0GHb1ixUDrGlOZX+13cF+Idt9m
	DhydjshPjxsHbjSBrh53uZUqJsrn1vkGw8iYJ6ulJd7Jz8dXueWeQqK0aM6gTXIo/g63cGLeOFU
	Dgtra2TanIXtdDaeZmix6NL0SFti587MSR5FJ6mQAlCgWFjdUh6cJCIfmgnxgXUJ7exKKmCPV/y
	T0vWcHFepzf6YhzSYXzp2PH/ElbfbLB1/DPno5FInorPjR0k
X-Received: by 2002:a05:6a00:2c97:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-73dc15d08c6mr642777b3a.22.1744930657790;
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoB7H68XEErrSA2lFS2YG9DINArEYkCAURDJO0L4ZNF6Rv2nt8aHjeYRdun73VPQRwNGxqgQ==
X-Received: by 2002:a05:6a00:2c97:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-73dc15d08c6mr642755b3a.22.1744930657326;
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
References: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid deadlock during
 regulatory update in ath12k_regd_update()
Message-Id: <174493065662.1347382.15714034015682377931.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:36 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: yCvTPn7vHvKZLKiMi7MqKyu6uUW87YTk
X-Proofpoint-ORIG-GUID: yCvTPn7vHvKZLKiMi7MqKyu6uUW87YTk
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=68018763 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=XmNsEsqR38t-_iXGnxEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=789 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155740_235763_36FE4F1A 
X-CRM114-Status: UNSURE (   9.18  )
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


On Tue, 08 Apr 2025 13:39:48 +0800, Baochen Qiang wrote:
> Running this test in a loop it is easy to reproduce an rtnl deadlock:
> 
> iw reg set FI
> ifconfig wlan0 down
> 
> What happens is that thread A (workqueue) tries to update the regulatory:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()
      commit: f335295aa29c2198d3aa02366e7c42cb2e4f7c99

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


