Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D4DC7EE32
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8PVwSPyQ0skiggn8tPu5UD8MYXZOpVsqOR/uAjnl0g=; b=cejozNv14TDyQzAE6ghUsbpH9I
	0lsh4ZQ4DWG1yFK+64kD1poVLbbNz6rauNspsSUcMZjxhsqoLh83rO3S+wWAN7vINxQZ+Wja9whIh
	WHwl3TAubnTUogd+dULl+fdLfZZHTY3V+gtcABpxw6HkGDMWr6v62dkSTDUVJgHDh915OhfzS39Vj
	OPR5LeNb37AtzrS/pZT2KwqfO+kKva/q7UPS9ARJoarnb6WapJRt3pkLds6p1oqGWoLS47dn+IziE
	n5pRCVeKN8cNQeGR06rAVIisScJcpzbxcbMGXNYkvVQdPym9vxWDOleMaDWVJn9SZkU6u3zacw15E
	X2zayx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzg-00000003hDb-2Ojn;
	Mon, 23 Jun 2025 18:34:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTV-000000036wc-1OIG
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9el45000414
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8PVwSPyQ0skiggn8tPu5UD8MYXZOpVsqOR/uAjnl0g=; b=OHuLIHWnpYNUCr5s
	HhMDABuIVOiO3uKeCt+Q7y2BH3oGmRvsPZ1Or7LVKeI1I/XhO9jE3lxfX2m1cCMk
	ltDHEcUVkaeUKifRRiGHaHBg1UMQGldpnLCGKB/tqTguJZQgScFGp2gUXwm5jZTD
	o4n+HZgbTO33/SnduzTM//a+4VqpZ8bYKyL2fQGgNpsqZtYG2F3T34c9xHiom5H5
	HJI9xAJUMZQIuyFyZmoOhUb7ENzJ/nmEdIN/0nBTPQomUPvEOx9oYP+d8CSqNozq
	T/EiqviFwehVkRrFDRUGE5mCYW55jHfIkaI/H6fbAkxSo1tEcx1z0rPwpGGCjP1b
	8lYV3g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7u9mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4594113b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690123; x=1751294923;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8PVwSPyQ0skiggn8tPu5UD8MYXZOpVsqOR/uAjnl0g=;
        b=FKrYe3UJr5qYSAeOX3vPnPNGgtU3tN8FkdI5JxmywarB5gv1Qm4F1oiUmZo5i+wz97
         6l+AvXaKER/plIzDKBaoPo889Wd6/yajO54MF92tOIbpP69UmfsSy/YuaxUHmG2fKm+0
         JPdvq9veVyE5oZt+Dkcwg8w9cmWGJJeiNaI6AlWEMrEJE836gO+YxBWc1eotsI5wLbbH
         TpiAAetJ8WjZliis+6853NCr6A7JSIa62aQdTcwWhA9fQkIsNIG4ZGf0QjxEjHeMFFU+
         cWXLVZe8+CU+WX2RjxwHYmAu/Nf7NLRQCRZ9ghs1FRkIcDT2hX/qh1NTnc4xZ+Fuxujc
         QWBQ==
X-Gm-Message-State: AOJu0YzUIXS3/TOz/q21vGKEV+9/PIYa3+pSNyIuNf+tFioSXv3AMdgS
	V8IoJEbtCB0z1E7xsofdxyHSFUlrfzjAykOnwNuI47W8RphFCBONFynkpT8iZo3rjJgeE7aO/T2
	TIEO0x8/grNmO5bYMCzF5pNkvUqCOKxTaSGI/AH5eeBd7Kb4H9uLtkHKxejYtFkp2
X-Gm-Gg: ASbGncuq4CCmPhI1UBc9L/U/1Tpr0ilcGGdT+RSi5iyJBVvs0EpnRReK31HZV1OUzUl
	OVki/r2aNe6fYDlmeHH18hPcwPmeHbUaOpK1Ojmgy6VzO9d6CD/ZNKdwFMYfso5CyrZweDx1apw
	9rjgcKDZmfkIjOjvCM5xIxTAKwZqDkRr9JkvZX9t4DDl7sX+yIuzztLPprRF4xk7UqnJ9o/3O9g
	O0mMcq4Mg57I79MWL1o26uRbIoCMQO/vk8FvfGylAOh1fRxnZYZ7Dc2OKxT0wW2q3ijJaKooCOu
	xhNXu/S/8NuvODk39x0eQoSyXIiHiv5lvaWTe/lgAWENMI/smRoIBWB3uPI=
X-Received: by 2002:a05:6a00:2289:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7490f474fb8mr19925219b3a.4.1750690122863;
        Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiDUbcCuweUNd6POV4Mu4A7JO9Pe70myaHyFh+DDkHtsxIJDLr9H/AUgdpPtj0vW+/9lD5iA==
X-Received: by 2002:a05:6a00:2289:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7490f474fb8mr19925193b3a.4.1750690122431;
        Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250522111514.3735107-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250522111514.3735107-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: combine channel list for
 split-phy devices in single-wiphy
Message-Id: <175069012182.3758471.11010293441396013758.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: pJGH6LEvYJQ1OA5Me5skGf6AJQxg92yp
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6859694c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OA4D8QjaPUCl9yRW1QAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXwVx/8qrR93wq
 9XIVGk6V+N4U6ReZ2wfKHPTih++K5OpmOYST5+div9D949vAcKrf5dVRmnbDU0J+RZL9lj8sKOB
 HwqKNlqbjNwH+NQVJAjxzqKlWHVLS0nqASaqLergP+oRs4Z8MrQkx3P2Bg7rUm6oWRup8YD6mED
 0jPncZozEBer+O9eTh2eV0VsBgKoGIyXrvy/NQuNl6Yw+F45wwWuUhqaNFV8EP+YsL7zRJgUozi
 /+GCWQvKjoh0Pzx5VZLPPBKfHS51E/t7sSVyTppS+9Dd9OUvWtYfLqllZaWfs2dIiCpQ3ADgjme
 BO02Og+uVik5yg8o13Tw9pWAE4gWGt8EGOOOSt0otIPUG37BQGivgA1qRpWEP/GyisZv/OfqFB0
 qOlPWp5ADC5TUhL1GelpV1xOXJgFd1dmmalMCkhRBDjp6C3sTlRNZ2H6bEnXpZfxbDrCT0r1
X-Proofpoint-GUID: pJGH6LEvYJQ1OA5Me5skGf6AJQxg92yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074845_490680_D6DCA837 
X-CRM114-Status: UNSURE (   8.44  )
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


On Thu, 22 May 2025 16:45:14 +0530, Rameshkumar Sundaram wrote:
> When two split-phy devices that support overlapping frequency ranges within
> the same band are grouped into an ath12k hardware (HW) setup, they share a
> common wiphy instance. Consequently, the channel list (wiphy->bands[])
> becomes unified across all associated radios (ar).
> 
> For reference, the devices are:
> 2.4 GHz + 5 GHz Low Band
> 5 GHz High Band + 6 GHz
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: combine channel list for split-phy devices in single-wiphy
      commit: acc152f9be205d76771f8156002d55c3fcd21252

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


