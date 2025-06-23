Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1402C7115D
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 05:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbAJSs7e+W6DSkxYogWtOVipiGhEsI4VPHyrkWooCW0=; b=Ghd1xL136ZvpVNJAu5N17za4jc
	G93rDiB75bf8gC7H5lpp6VAaTGcvkYN+Lz91RNEefGcc7Kj8b3pC97nlba2GlDyn1d5kZoiALPT1p
	XJqQnntG9n/yiNk+aHEZ3hSEp/Ox+W4iDWC5W9BeQSis9yvQaxRrflknj6PhrtJ3wSgtdH5IcD5p5
	eqR3pTUsEMtU7WJVcxeBuqE3j0i1VqOJ4VEaGMiLOjId4I9wmJAyZhlBsnwEaGkRAjHCFUiQfKFZX
	bj2ppYPJZ88cWq1ZBbHlfc7Hvj2PXTUt+DlurlEIzQY7Z6IjjbwSk6m0RbLcNN0n430SONzk5g+k9
	EqRyMiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZUL-00000001axE-1rYi;
	Mon, 23 Jun 2025 05:13:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZUI-00000001awr-3K0i
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:12:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eWE5029889
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbAJSs7e+W6DSkxYogWtOVipiGhEsI4VPHyrkWooCW0=; b=AqYwlgEayfWvPnUZ
	d6x5x6d0DcKHTZ7Yakl1X4ScboyOOiAUIHo5U95rJiRPB884V5iCZ8xWiFwuQ944
	ehhEOPgqjdsFzEnKgTdkD6/Ao21w5JPFWbTGm9wAo75N3uOAG7zmm5Q/CdQn4OWe
	bfmkixb3nw0ZUfibCkcmiaqLmAEa5Iq3Q5S4MC8Ps4WGlO8CBkNcIHEgff8h8B75
	jMtKJPwXF6MeVWggcsf6XUXcQRoYotNP+X/Q9bLO8QD7Jp9DxVB5UzTrRCaUBl7h
	SRBREGmbT/qUJ437HGjmjYBVoUqynBp3gj418BiAmOKJGvct9lwXH/z63FclSfCX
	TMOHmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k05ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:12:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so64891045ad.2
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655576; x=1751260376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbAJSs7e+W6DSkxYogWtOVipiGhEsI4VPHyrkWooCW0=;
        b=ZuKzEpg367KzXFyykbBzY4lBLXi8ehooKlnjiUeUHqBPKuhu5GcOCdCA+4h0FbJIYl
         5e9YVUge9Nz0Mg9HRqRzSSYsPqO+ZHrGs58Z+EH80B1q18096rGpt8MnRTnkAwY8FES7
         YezH6DydHVoGx3A6cFFc5XMui/vmVwPjBkl8gfFY6SNsSQkgJkYzOWoUNUSJyujTXyiH
         SgbwZUEvhmbsnqL+ZYvorBZoq6hsUzgUaXyTKrGA8NvJfoe19nFIz2EqvdMajRgltR/b
         6wxDiXCSnXQ2WBqUxXTaKLOD4OYRSk/5YKHPyM46fwOXTzYoZg16vgE1cDqy7DzieSb1
         vuHw==
X-Forwarded-Encrypted: i=1; AJvYcCXlg7ZD/HoWNPqm5DWJNTh3Mvy+7SBZ+na7gtwV3Oymq2IaO8qSdQCjGEIOii7s8DlwFdhmnr0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxazn8Zk/LDGbrn3wygJR6FxxPcngHQ51sYLuZaS3UcxS30orAO
	/WDyrNYV28sipKzhgsB2MjrP5Ea+ULlQvuT2xNaZHIknTPeJt19+pNuZcwH/Na9EN4Nin2Ql8kS
	us+NDvSw7w4PNiEB8Fw0d3ZvPH6eiFVMnnbgof8BtPsSapFGgZX9R10i0NRu1KEPB
X-Gm-Gg: ASbGncuNgOT3/ZceBhKy3dE+QkG328c7dHmzBNf1d2/v4Qa4OVhtOKTN9ntoO4kWuNy
	ZMTEfZD6+uhNNsGKGb9MHguSfzawU7gBA9cCq1sctatfjFrmPmBbqOQAsR/5K0PjxwJE+i9gV17
	Bp7yYodsaRz3tWX2kekC1XI+Lp1bPB7F5PyLjzxdGW7iFNdfIL04sbP7PILYquU/xgKWGwPDosf
	KYDEvOmBTb9G3ub+Sv44x8kmdWNLjwNrmZErNCTCZy/CHmU661RacZQQtIDiZco2MwyCf9YKH0M
	m9gqrS6DlcjWVORGL7rTaBBW8PhPfwtCf954HEJSkh4/26GV+TuN5T9VMQ/Rwuq1
X-Received: by 2002:a17:903:4b27:b0:235:1706:1fe7 with SMTP id d9443c01a7336-237d9779a73mr171741465ad.4.1750655576485;
        Sun, 22 Jun 2025 22:12:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwMZ1SQmGpw1GCwWrne92h5uRBiJ7YyYVhZ6BaiiirHUJCGrrpZsIAOqwQA0NjRo2sQWgAsw==
X-Received: by 2002:a17:903:4b27:b0:235:1706:1fe7 with SMTP id d9443c01a7336-237d9779a73mr171741235ad.4.1750655576107;
        Sun, 22 Jun 2025 22:12:56 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393275sm74674125ad.39.2025.06.22.22.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:12:55 -0700 (PDT)
Message-ID: <954d3235-0fba-6208-011b-79cebeecc0bd@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:42:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable REO queue lookup table
 feature on QCN9274 hw2.0
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=6858e259 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=hk8jstzJOELweJxXsYQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Yb1O-WQ2xzmRKW0Q5PUWR-OrQw-x339H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOCBTYWx0ZWRfX2k8SonOhyAwc
 l6qm+KmkWCAOviuS646+HzJrPHBHfAUpRLeaAfStbxcIZzvVHdSlwAy1GjTyQKIsBmegqFhj4wL
 zFC2Y93DaGwlLbRj0s1wFZKgupjGllOElWLSGpv5QJmHbiLBTPxMKcjs3BAtvsTTqn6h9oiZuLa
 DqnG2bvqoe8Kb0U6Uo39cTxHs3HZpISgkSgfs9GQpqejzMFkBvWzg2u6f1AxLE5DaXojPsuURIQ
 /33QKAOTA7goATycLT3of9nNbqF8/Ac9saPRzGeF1yjOp7FLRgQl/7SiapK+fnUqe2SRstfY3aK
 gWO3X/EL34G2rkZvJ7Ht79LpxKCV7XqJ63xPoQDOlY3ZGciKN4gdmMuDfBeD/TJeUCfSeRlpdef
 qCaa0dyXs4eaMV3KcGCV4gVSkDY88qCRZohiejh89w/7NsGt6o0aJdARik/wq6fjDijVXWRn
X-Proofpoint-GUID: Yb1O-WQ2xzmRKW0Q5PUWR-OrQw-x339H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=931 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_221258_953381_A679D605 
X-CRM114-Status: UNSURE (   7.61  )
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



On 6/9/2025 8:48 AM, Raj Kumar Bhagat wrote:
> The commit 89ac53e96217 ("wifi: ath12k: Enable REO queue lookup table
> feature on QCN9274") originally intended to enable the reoq_lut_support
> hardware parameter flag for both QCN9274 hw1.0 and hw2.0. However,
> it enabled it only for QCN9274 hw1.0.
> 
> Hence, enable REO queue lookup table feature on QCN9274 hw2.0.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

