Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB04E7718A
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOnwA6W2GL2HPdIgKiB+P5Wh8IyDu3xLN7C+vWRW0Dw=; b=IB9YLXSvXQp2HCp3JB0+eb+qiq
	haYK7B2XUaag9SC5oiVirLRYlH3ZiMTwMyr42kaSYOtowCWkFFBzQjetseQOfJjQinCz38AUwadwO
	3+S2oxr1aMS3SXscSm879qIxP87Sr+YEF0L5dA9lYoxr02bACVMCekkmuHNYlvEoWPLzSDYnAqbwr
	uzaAc30s318YA20VbdNjdr0etcV/XOx9Idl9q2T1flUJ2vsTazpGVeZc+Ow5MEWqOvbPV6U148bsD
	7Ezx6K4ew34VgUwQA5d2ZgLjw2rAaAn5/SdO0fVwfygJOz8IL+t6emxVpfXkahFPXfVh4DaOh9t5N
	c0isk8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKvj-00000002gse-2WiJ
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 18:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKjg-00000002e71-2FRa
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 17:54:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJF4ZIl028829
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOnwA6W2GL2HPdIgKiB+P5Wh8IyDu3xLN7C+vWRW0Dw=; b=gW34Mx9SmAnI3UaW
	PkFJYeZ9Dub3Ma4qx1npm6QneUP5jKopjWVr0w4qx+iDUxi68H6aDr6c6kNpuCgN
	h/Kkg6ehFqMGyTEUMxNVV3Fb2dn4fv2ctgP2yGv/Bb/sXHLlitdj3OQSqcwuUjj8
	pDiVGFCsYWrLUzWBPiA/HyLZuEte7j1vqkT4Pd+oPjWFSLQajpWRom3F6B9j41rd
	08eErwCCKfzDhqoXNwA7TDQDkU/407p+Gjh5q0/c+vEQbTquQvfIZ6NZZsl/LVdB
	4gbqAxvZQCPpiv+S0U9s+FFnMs4sKOPlWoF9Kyqja78C6WRWF58rocLUh/abEVEY
	ofx7ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mntf0fgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso1022395a91.0
        for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 09:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630894; x=1735235694;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOnwA6W2GL2HPdIgKiB+P5Wh8IyDu3xLN7C+vWRW0Dw=;
        b=rDWY55q2M4SEPx5MPq1VybY7IDJ+ISdDXxCZQsZ5MrNjS7IFj1OqR6OgTcrYlyhMdI
         pfMLlgjYn3PiX9GOZ9Y7vvCS5GmQWpSRlg9cEBvpuQzI92uHCkPiy4OyWdOKFNiw4c0R
         Dhr6zenHQ6DWJpglWkesi+bXNfzUIswtRg3Ro5IPwwVmF+LFAyKzczksN/6KiAJWfJLD
         moSyOWOq7CyN7Lxq9OPWmE+TPfmNoVTngKNJC+QLxcbJOX0ZJDyx16OnyY/gy4uJ0HTt
         /ELsWmfmHaRfTGAXzsLdiTEkN+j117bJwNlwxBE+TJ0XG/5sn2kU9kZqFGTHQnrnX/7+
         sS6A==
X-Gm-Message-State: AOJu0Yz4Rqls9x1xa10y40YT1NYfPLi7GwYIePYWfuhMQK/PivO3cPvM
	7hjonnRvYiXuzchSv3W2AA/qXNtS7CwatPHJ+YuIBbjbtrpH7QiXl9oQwqiZ9XvRR1pSSKcEPqR
	lkY3l6kA47AkNJ2qcKgAduXwjhjkvYtfR1zGKxLlM/XxUGS6sUBnb+7lY3zvqaq/fyBeH
X-Gm-Gg: ASbGncvNPYS7JDwPm9i5p34TQuvJu7JshCjUZnmn2vMec4edtLkb3Qp4Ui4vPK9PpWd
	0GMQy5G2fFDN8yxmQ01mIFzJchkrrs5ChisEZ4uKlw4v4inYEAj2tE6BHMxlQhtBVqc0lLIEhBT
	8O9DyOnCLmAP+Ul/o80j1UV3VUqSEFV7Cx2nZjzDs0EffJudCqmw37FQaXfZIQWZr+AwOScKa1i
	YNfJqwOU18e4X0LFTjvq5slY9q7QFAyB42RTnULx5Jptbs36fpcytZDDzX9hh7PbQNkNW69pJHX
	xvW3gkNv6IdHKkCmSw==
X-Received: by 2002:a17:90b:50c3:b0:2ee:f19b:86e5 with SMTP id 98e67ed59e1d1-2f443ce9ae5mr6635891a91.14.1734630894624;
        Thu, 19 Dec 2024 09:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkGZyv5SblMwujUmRbi/VoqJhm/83fCe3NOtmsuZSUKguNM0EEIu5MlyTwFcAn8aF8/xWILw==
X-Received: by 2002:a17:90b:50c3:b0:2ee:f19b:86e5 with SMTP id 98e67ed59e1d1-2f443ce9ae5mr6635869a91.14.1734630894259;
        Thu, 19 Dec 2024 09:54:54 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm3630628a91.52.2024.12.19.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:54:53 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
Subject: Re: [PATCH v3 0/8] wifi: ath12k: Refactor the monitor status Rx
 path
Message-Id: <173463089358.2609009.17500722670336215744.b4-ty@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 09:54:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: KHTqCJgFa0A5j4tQtKT9-n4rx4FIqxWJ
X-Proofpoint-ORIG-GUID: KHTqCJgFa0A5j4tQtKT9-n4rx4FIqxWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=781
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095456_588119_3365950B 
X-CRM114-Status: GOOD (  12.47  )
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


On Tue, 17 Dec 2024 14:15:03 +0530, Karthikeyan Periyasamy wrote:
> Currently, the monitor status Rx path was inherited from ath11k but has
> not been updated for the ath12k 802.11be hardware. Also there is no issue
> at present since the monitor status Rx path is not enabled. However, in
> the future, the monitor status Rx path will be enabled. Therefore, it is
> necessary to update the TLV structures, bitmask definitions, remove the
> unused bitmask, change the Tx monitor SRNG ring ID and refactor the
> monitor status parse handler.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: Add documentation HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
      commit: d506e55fe39bcd6a78bd1f23210cbcd8cee4f844
[2/8] wifi: ath12k: Refactor monitor status TLV structure
      commit: 61a0d9a879c3682391f88855220dd766bb9d6542
[3/8] wifi: ath12k: cleanup Rx peer statistics structure
      commit: 6a6d941a39947c359ed245fca490dcdb09551235
[4/8] wifi: ath12k: Fix the misspelled of hal TLV tag HAL_PHYRX_GENERICHT_SIG
      commit: b79462532cd56119fb409f81f50dc74b12724b5e
[5/8] wifi: ath12k: fix incorrect TID updation in DP monitor status path
      commit: ebee84cc961cd3947015efbf4a5dbea63b11c5d3
[6/8] wifi: ath12k: Remove unused HAL Rx mask in DP monitor path
      commit: 0345f28a122656a4703442a2a97d2dca370c27a0
[7/8] wifi: ath12k: Change the Tx monitor SRNG ring ID
      commit: 61f247a06c3cdeb9093b3d90afd7d51168d089f4
[8/8] wifi: ath12k: Avoid explicit type cast in monitor status parse handler
      commit: 8534c42397ed8f05257dbddcd305a351ad40add1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


