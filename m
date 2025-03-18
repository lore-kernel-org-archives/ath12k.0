Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FB8C35FF3
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evxBLxF0vJkO86a539w8EsrBTfuvbVoib+/2TU9Ycto=; b=iNCcznmrcFGgDm5iYLZ6YEa/z0
	fGie7U+rZfuBK6xm/aZ5BhL2LgUQ/5bLnisJjpyNFU1P6PdEl0eQOeyPqJSPwdXR2lWCs6gpqDTmv
	wRvjJksKoD2RVm+7lHiITat7hZ1nsJX1o8+oxXdXravHEKy9YKz89pKVLCNnNjXdEU91hNXj3iqeY
	T9JoVNUseoEjtINUZA6XpasoWHXhp1z2X2YPZyUb4JsrWBnD7XuNMKpEbU1PmBhduDYaXDbBIlaAv
	2LJDi7mXS15+VEBRdw+EV+06VD+BE6pFq152vR4qFC/MZrYrSIcvJ2uRL9gGX8Vu7w+eSQFDo6QAx
	HfQpvF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEd-00000004bXM-2hge
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 04:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO9k-00000004azb-22Xc
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 04:02:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I1ADgB019834
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 04:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evxBLxF0vJkO86a539w8EsrBTfuvbVoib+/2TU9Ycto=; b=U2hCufXUfpZVqgvE
	m9WMkyz4XJjMLsMOD19uVu7sD7AzpFDZfhfbcIBEdLUfzConP9sUhVwxylhqiVPm
	4KWhW7ETSxeBFGPoG99VgiqsA02vaZheTE1ToJDnYDZR8vZJUwsjYDErr85PmXQJ
	uKjekdmJhKWG0ssb+WnVwpJLsha9VHPSKmw+y0RhwJCR3Iqzs4YJnN1OMDTETDFa
	jtNXSVq70vhit+nZPbPua9Wr/Ivscv/C8N5Uai9wjEvHvzNntEP9aJjzF4FaJ2QQ
	j7D+gouFdDjDXdjQT+eMOw893YSsipMsc/CabN6zJNJpcMIgj6BThhlFTMkpRlMb
	DSsxCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbgc7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 04:02:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2255ae39f8fso105045895ad.0
        for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 21:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270534; x=1742875334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evxBLxF0vJkO86a539w8EsrBTfuvbVoib+/2TU9Ycto=;
        b=V7VSU5W0MNunULCI+1dTlB1kJy8SPs/4dTaKdXOQdOUuwqIN+btVZ4s6n1cEqOyiqh
         Rec7cUpZz9s7l33L+QCDmHltkinMGfThKlTpvtYms8UYD4tG1IAuSmEFkyTtcAl7iVTt
         YtxwHWnOoXmc7AdyqsNJk6h/Am6kYcuUh/B9Uxe/CsrbLUijVrkD+kb5TgN+hMIxaXBA
         YZnl1vpA+D6+RrsAchzeVY78iSYDyLe2fBJOL8BIum7wxuZXQ5jDG6TjIWvUycukzSr4
         tkbnsTOJXE+iCOeUkaVW51vZCxtfXTM2Ps/RGpDVOIe0uNp1dNFnPg6j8BuUBLP3/brX
         vFLg==
X-Forwarded-Encrypted: i=1; AJvYcCV2WvF+hRRvwj0A5G5mVNNcnyiqIsR0XsA44U67ulsyG9s2GSVr756F+tI28nqSMCb2pMoRD3M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxAnLuTVUbwN1hG1Oey5yeJNKj8/d3WQrw/mU+cAq91H+KODkc
	Mwn9+gYJ9+LaFiGTuN2bweueOgCpNKe9v0LBEkADGR3Xy15m4oqCx8HZk6lGguMmiQWCv/Lba+C
	0mwiYvtrCkm9ftrPtlpaqh2gSV5pae7wqchEc+dl2Lwdhr8vnVqK5Z/b28Fv1
X-Gm-Gg: ASbGncvxanc7/a7NmLo+C/lyzt+jXCtsfrPXXQKEL8gJhR93mgVIL/henzyglRASpl7
	UHc3Z+IilBlu1zhjwTgqE+oyaVy8af76jcVuiAQ97dpf3uMbvf1ecf730tKy5A8P06kng2IMDnQ
	uajxilyn+ur9M9p6uQT53CFVCcCKaOcDcd7/cK52pcL47eqeycG33/7TEjIBNMQn0O87fGzg0c7
	zhuAAH0wUTMmaLXeqJlMvJxQiTgR1AcuT8FYTuT8fexkX6hiBmFOoAdhqHwSEbvTneP+sPqerv5
	frgv8C56QC0I6nG46frzZLhxX7HN98rYxn124ntAWcURQ+71GASdYC0aEg==
X-Received: by 2002:a05:6a00:908d:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-73757764898mr3353852b3a.2.1742270533943;
        Mon, 17 Mar 2025 21:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfTlJDWwrgB/atBHiVL6o/A1R1cqHfM05IhNbPgNmLuzKd0jt55qXiKn1o6c6a9erICRKnVQ==
X-Received: by 2002:a05:6a00:908d:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-73757764898mr3353821b3a.2.1742270533558;
        Mon, 17 Mar 2025 21:02:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711578e09sm8465029b3a.73.2025.03.17.21.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 21:02:13 -0700 (PDT)
Message-ID: <f7f9ab59-2667-19b1-98a3-47843f5b3e83@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 09:32:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v11 13/13] wifi: ath12k: enable ath12k AHB
 support
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250317204639.1864742-14-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250317204639.1864742-14-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d8f046 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=w_ZfqNI5J2udKohul8UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KgkfLTGAoei-CYEfGL6cNSakk2WK-pbw
X-Proofpoint-GUID: KgkfLTGAoei-CYEfGL6cNSakk2WK-pbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=778
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_210220_536872_32CE0285 
X-CRM114-Status: UNSURE (   9.07  )
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



On 3/18/2025 2:16 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Currently only PCI devices are supported in Ath12k driver. Refactor
> Ath12k module_init and module_exit to include Ath12k AHB support.
> 
> Add Ath12k AHB support in Kconfig with dependency on Remoteproc
> driver. Ath12k AHB support relies on remoteproc driver for firmware
> download, power up/down etc.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

